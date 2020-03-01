# frozen_string_literal: true

class AddLocateToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :locate, :string
  end
end
