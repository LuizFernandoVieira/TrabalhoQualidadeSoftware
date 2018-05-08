class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :phone_number
      t.string :password

      t.timestamps
    end
    add_index :users, :nickname, unique: true
  end
end
