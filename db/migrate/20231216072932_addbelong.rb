class Addbelong < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category_id
    add_column :products, :category_id, :belong_to
  end
end
