class CreateConfirms < ActiveRecord::Migration[5.2]
  def change
    create_view :confirms
  end
end
