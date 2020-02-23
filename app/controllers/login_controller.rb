class LoginController < ApplicationController
  before_action :set_user, only: [:reserved]


  def login
    session[:hotel_id] = params[:id]
  end
  def check
    if @guest.authenticate(login_params[:password])
      sign_in(@guest)
      redirect_to '/users/reserved'
    else
      flash.now[:danger] = t('.flash.invalid_password')
      render 'new'
    end
  end
  def reserved
  end
  def destory
    sign_out
    redirect_to '/users'
  end
  def reserved
  end
  def signin
    @guest = Guest.new
  end
  def create
    @guest = Guest.new(user_params)
    if @guest.save
      redirect_to '/users/login'
    else
      redirect_to '/users/create'
    end
  end

  private

    def user_params
      params.require(:guest).permit(:name, :mail, :password, :password_confirmation)
    end

    def set_user
      @guest = Guest.find_by!(mail: login_params[:mail])
    rescue
      flash.now[:danger] = t('.flash.invalid_mail')
      render action: 'login'
    end

    # 許可するパラメータ
    def session_params
      params.require(:login).permit(:mail, :password)
    end
end
