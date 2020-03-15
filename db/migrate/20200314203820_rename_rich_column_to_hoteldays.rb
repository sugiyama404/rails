# frozen_string_literal: true

class RenameRichColumnToHoteldays < ActiveRecord::Migration[5.2]
  def change
    rename_column :hoteldays, :rich, :richvacant
  end
end
