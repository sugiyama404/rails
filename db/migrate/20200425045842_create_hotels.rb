class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :bestname
      t.string :richname
      t.string :fourthname
      t.string :doublename
      t.string :mails
      t.text :address
      t.string :imgname
      t.string :imgname
      t.string :password

      t.timestamps
    end
  end
end
