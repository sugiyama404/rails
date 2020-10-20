class CreateHoteldays < ActiveRecord::Migration[5.2]
  def change
    create_table :hoteldays do |t|
      t.integer :hotel_id
      t.integer :bestvacant
      t.integer :richvacant
      t.integer :fourthvacant
      t.integer :doublevacant
      t.date :days

      t.timestamps
    end
  end
end
