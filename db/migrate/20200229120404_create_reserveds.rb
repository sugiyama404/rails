# frozen_string_literal: true

class CreateReserveds < ActiveRecord::Migration[5.2]
  def change
    create_table :Reserveds do |t|
      t.integer :guest_id
      t.integer :hotel_id
      t.string :room
      t.integer :guestnum
      t.date :Reservedday

      t.timestamps
    end
  end
end
