# frozen_string_literal: true

class UsersController < ApplicationController
  def user
    # @hoteldays = Hotelday.left_joins(:hotel)
    # @hotelprices = Hotelprice.all
    num = params[:adultnum].to_i + params[:childnum].to_i
    @confirms = Confirm.search2(params[:area], params[:checkin], params[:checkout], num)
  end
end
