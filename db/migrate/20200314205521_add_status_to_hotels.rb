# frozen_string_literal: true

class AddStatusToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :richname, :string, after: :bestname
    add_column :hotels, :fourthname, :string, after: :bestname
    add_column :hotels, :doublename, :string, after: :fourthname
  end
end
