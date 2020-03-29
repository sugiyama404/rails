# frozen_string_literal: true

class UsersController < ApplicationController
  def user
    num = params[:adultnum].to_i + params[:childnum].to_i
    @confirms = Confirm.search2(params[:area], params[:checkin], params[:checkout], num).page(params[:page]).per(4)
  end
end
