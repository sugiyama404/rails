# frozen_string_literal: true

class RenameReserveddayColumnToReserveds < ActiveRecord::Migration[5.2]
  def change
    rename_column :reserveds, :Reservedday, :reservedday
  end
end
