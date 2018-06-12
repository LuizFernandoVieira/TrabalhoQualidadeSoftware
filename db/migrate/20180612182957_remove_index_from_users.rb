class RemoveIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :nickname
    remove_column :users, :shelf_id
  end
end
