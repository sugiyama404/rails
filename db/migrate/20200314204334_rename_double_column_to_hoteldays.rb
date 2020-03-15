# frozen_string_literal: true

class RenameDoubleColumnToHoteldays < ActiveRecord::Migration[5.2]
  def change
    rename_column :hoteldays, :dublevacant, :doublevacant
  end
end
