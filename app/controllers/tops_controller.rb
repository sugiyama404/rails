# frozen_string_literal: true

class TopsController < ApplicationController
  def top
    render layout: false
    require 'date'
    Date.today.to_time

    hoteldays = Hotelday.new(hotel_id: 1, best: 2, rich: 4, fourth: 4, double: 2, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 2, best: 3, rich: 4, fourth: 6, double: 1, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 3, best: 4, rich: 3, fourth: 7, double: 3, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 4, best: 5, rich: 6, fourth: 6, double: 12, days: Date.today.to_time)
    hoteldays.save
  end
end
