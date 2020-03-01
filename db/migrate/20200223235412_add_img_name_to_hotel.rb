# frozen_string_literal: true

class AddImgNameToHotel < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :imgname, :string, after: :address
  end
end
