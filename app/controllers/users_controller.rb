# frozen_string_literal: true

class UsersController < ApplicationController
  def user
    @hoteldays = Hotelday.left_joins(:hotel)
    @hotelprices = Hotelprice.all
    @hotelcount = Hotel.all
  end
end
