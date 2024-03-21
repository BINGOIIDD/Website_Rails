class D < ActiveRecord::Migration[6.1]
  def change
    remove_index :products, :category_id
  end
end
