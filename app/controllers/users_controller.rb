# frozen_string_literal: true

class UsersController < ApplicationController
  def user
    #  session[:hotel_id].clear
    @hoteldays = Hotelday.left_joins(:hotel)
    @hotelprices = Hotelprice.all
  end
end
