class CreateReserveds < ActiveRecord::Migration[5.2]
  def change
    create_table :reserveds do |t|
      t.integer :guest_id
      t.integer :hotel_id
      t.integer :stayday
      t.string :room
      t.integer :guestnum
      t.date :reservedday

      t.timestamps
    end
  end
end
