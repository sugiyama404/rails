class RemoveImgnameFromHotels < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :imgname, :string
  end
end
