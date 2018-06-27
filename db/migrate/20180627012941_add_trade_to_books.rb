class AddTradeToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :trade, :boolean, default: false
  end
end
