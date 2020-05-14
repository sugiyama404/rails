# frozen_string_literal: true

class TopsController < ApplicationController
  def top
    render layout: false
    require 'date'
    require 'expanded_date'

    # ダミーデータ
    boo = Hotelday.order(days: :desc).limit(1)
    boo2 = boo.pluck(:days)
    miniday = boo2[0]

    day = Date.today
    # 月初日
    start_date = Date.new(day.year, day.month, 1)
    # 月末日
    end_date = start_date >> 1
    end_date -= 1
    if miniday.present?
      if miniday < day
        (start_date..end_date).each do |date|
          (1..15).each do |num|
            hoteldays = Hotelday.new(hotel_id: num, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: date)
            hoteldays.save
            hotelprices = Hotelprice.new(hotel_id: num, bestprice: (rand(9) * 1000 + 40_000), richprice: (rand(9) * 1000 + 30_000), fourthprice: (rand(9) * 1000 + 20_000), doubleprice: (rand(9) * 1000 + 10_000), newday: date)
            hotelprices.save
          end
        end
      end
    else
      (1..15).each do |num|
        hoteldays = Hotelday.new(hotel_id: num, bestvacant: rand(4), richvacant: rand(6), fourthvacant: rand(10), doublevacant: rand(10), days: day)
        hoteldays.save
        hotelprices = Hotelprice.new(hotel_id: num, bestprice: (rand(9) * 1000 + 40_000), richprice: (rand(9) * 1000 + 30_000), fourthprice: (rand(9) * 1000 + 20_000), doubleprice: (rand(9) * 1000 + 10_000), newday: day)
        hotelprices.save
      end
    end
  end
end
