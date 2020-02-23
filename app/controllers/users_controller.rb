class UsersController < ApplicationController
  def user
  #  session[:hotel_id].clear
     @hoteldays = Hotelday.left_joins(:hotel)
  end
  def registor
  end
end
