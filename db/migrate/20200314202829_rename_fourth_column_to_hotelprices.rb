# frozen_string_literal: true

class RenameFourthColumnToHotelprices < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotelprices, :fourth, :fourthprice
  end
end
