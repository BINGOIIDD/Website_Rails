class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :products, :category_id
  end
end
