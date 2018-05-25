class AddShelfToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :shelf, foreign_key: true
  end
end
