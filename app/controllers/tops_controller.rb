# frozen_string_literal: true

class TopsController < ApplicationController
  def top
    render layout: false
    require 'date'
    # ダミーデータ
    boo = Hotelday.order(days: :desc).limit(1)
    boo2 = boo.pluck(:days)
    miniday = boo2[0]
    miniday2 = if miniday < Date.today
                 Date.today
               else
                 boo2[0] + 1
              end

    (1..15).each do |num|
      hoteldays = Hotelday.new(hotel_id: num, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: miniday2)
      hoteldays.save
      hotelprices = Hotelprice.new(hotel_id: num, bestprice: (rand(9) * 1000 + 40_000), richprice: (rand(9) * 1000 + 30_000), fourthprice: (rand(9) * 1000 + 20_000), doubleprice: (rand(9) * 1000 + 10_000), newday: miniday2)
      hotelprices.save
    end
  end
end
