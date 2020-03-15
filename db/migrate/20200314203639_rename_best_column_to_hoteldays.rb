# frozen_string_literal: true

class RenameBestColumnToHoteldays < ActiveRecord::Migration[5.2]
  def change
    rename_column :hoteldays, :best, :bestvacant
  end
end
