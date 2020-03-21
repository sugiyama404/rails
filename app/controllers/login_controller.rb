# frozen_string_literal: true

# login class
class LoginController < ApplicationController
  require 'date'
  before_action :set_user, only: [:check]

  def login
    session[:hotel_id] = params[:id]
  end

  def check
    if @guest.authenticate(login_params[:password])
      @guestid = Guest.find_by(password_digest: login_params[:password],
                               mail: login_params[:mail])
      session[:guest_id] = @guest.id
      sign_inhh(@guest)
      redirect_to '/users/reserved'
    else
      flash.now[:danger] = t('.flash.invalid_password')
      redirect_to '/users/search'
    end
  end

  def reserved
    session[:days] = if params[:selectdays].present?
                       params[:selectdays]
                     else
                       Date.today
                     end
    @confirm = Confirm.where(id: session[:hotel_id].to_i).where(days: session[:days])
    if @confirm.present?
    else
      @confirm = Defaultconfirm.where(id: session[:hotel_id].to_i)
    end
    @reserveds = Reserved.new
  end

  def save
    @reserveds = Reserved.new(reserved_params)
    if @reserveds.save
      session[:days] = nil
      session[:hotel_id] = nil
      redirect_to '/users/search'
    else
      redirect_to '/users/reserved'
    end
  end

  def destory
    sign_out
    redirect_to '/users/search'
  end

  def signin
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(user_params)
    if @guest.save
      redirect_to "/users/#{session[:hotel_id]}/login"
    else
      redirect_to '/users/search'
    end
  end

  private

  def user_params
    params.require(:guest).permit(:name, :mail, :password,
                                  :password_confirmation)
  end

  def set_user
    @guest = Guest.find_by!(mail: login_params[:mail])
  rescue StandardError
    flash.now[:danger] = t('.flash.invalid_mail')
    render action: 'login'
  end

  # permmiting parameta
  def login_params
    params.require(:login).permit(:mail, :password)
  end

  def reserved_params
    params.require(:reserved).permit(:guest_id, :hotel_id, :stayday,
                                     :room, :guestnum, :reservedday)
  end
end
