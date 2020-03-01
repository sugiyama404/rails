# frozen_string_literal: true

class RenameLocateColumnToHotels < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotels, :locate, :address
  end
end
