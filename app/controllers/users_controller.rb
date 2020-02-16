class UsersController < ApplicationController
  def user
 #   @hoteldays = Hotelday.all
     @hoteldays = Hotelday.left_joins(:hotel)
  end
  def registor
  render layout: false
  end
end
