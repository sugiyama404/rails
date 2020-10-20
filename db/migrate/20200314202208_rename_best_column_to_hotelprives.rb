# frozen_string_literal: true

class RenameBestColumnToHotelprives < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotelprices, :best, :bestprice
  end
end
