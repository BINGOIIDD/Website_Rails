class A < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category_id
  end
end
