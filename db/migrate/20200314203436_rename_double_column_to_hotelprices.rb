# frozen_string_literal: true

class RenameDoubleColumnToHotelprices < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotelprices, :double, :doubleprice
  end
end
