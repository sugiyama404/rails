# frozen_string_literal: true

class CreateHotelprices < ActiveRecord::Migration[5.2]
  def change
    create_table :hotelprices do |t|
      t.integer :hotel_id
      t.integer :best
      t.integer :rich
      t.integer :fourth
      t.integer :double
      t.date :newday

      t.timestamps
    end
  end
end
