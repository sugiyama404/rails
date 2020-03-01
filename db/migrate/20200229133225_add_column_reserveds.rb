# frozen_string_literal: true

class AddColumnReserveds < ActiveRecord::Migration[5.2]
  def change
    add_column :Reserveds, :stayday, :integer, after: :hotel_id
  end
end
