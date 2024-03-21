class RemoveNameFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :name, :string
  end
end
