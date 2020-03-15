# frozen_string_literal: true

class RenameFourthColumnToHoteldays < ActiveRecord::Migration[5.2]
  def change
    rename_column :hoteldays, :fourth, :fourthvacant
  end
end
