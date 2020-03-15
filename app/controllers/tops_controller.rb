# frozen_string_literal: true

class TopsController < ApplicationController
  def top
    render layout: false
    require 'date'
    Date.today.to_time

    hoteldays = Hotelday.new(hotel_id: 1, bestvacant: 2, richvacant: 4, fourthvacant: 4, doublevacant: 2, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 2, bestvacant: 3, richvacant: 4, fourthvacant: 6, doublevacant: 1, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 3, bestvacant: 4, richvacant: 3, fourthvacant: 7, doublevacant: 3, days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 4, bestvacant: 5, richvacant: 6, fourthvacant: 6, doublevacant: 12, days: Date.today.to_time)
    hoteldays.save
  end
end
