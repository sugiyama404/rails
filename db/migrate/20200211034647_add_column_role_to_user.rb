# frozen_string_literal: true

class AddColumnRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :integer
  end
end
