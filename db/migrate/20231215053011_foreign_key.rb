class ForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :category_id, :integer
    add_foreign_key :products, :categories, column: :category_id
  end
end
