class C < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :products, :categories
    add_index :products, :category_id
  end
end
