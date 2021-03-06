# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :mail
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
