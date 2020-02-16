class CreateHoteldays < ActiveRecord::Migration[5.2]
  def change
    create_table :hoteldays do |t|
      t.integer :hotelid
      t.integer :best
      t.integer :rich
      t.integer :fourth
      t.integer :double
      t.date :days

      t.timestamps
    end
  end
end
