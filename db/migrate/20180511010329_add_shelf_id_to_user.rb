class AddShelfIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shelf_id, :integer
    add_index :users, :shelf_id
  end
end
