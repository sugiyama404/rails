# frozen_string_literal: true

class RenameRichColumnToHotelprives < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotelprices, :rich, :richprice
  end
end
