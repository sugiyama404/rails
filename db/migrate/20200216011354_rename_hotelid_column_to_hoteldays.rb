class RenameHotelidColumnToHoteldays < ActiveRecord::Migration[5.2]
  def change
    rename_column :hoteldays, :hotelid, :hotel_id
  end
end
