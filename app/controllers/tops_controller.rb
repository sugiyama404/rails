# frozen_string_literal: true

class TopsController < ApplicationController
  def top
    render layout: false
    require 'date'
    # Date.today.to_time

    hoteldays = Hotelday.new(hotel_id: 1, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 2, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 3, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: Date.today.to_time)
    hoteldays.save
    hoteldays = Hotelday.new(hotel_id: 4, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: Date.today.to_time)
    hoteldays.save
  end
end
