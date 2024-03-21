class Fff < ActiveRecord::Migration[6.1]
  def change
    drop_table :categories_products
  end
end
