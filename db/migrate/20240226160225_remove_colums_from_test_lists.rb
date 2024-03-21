class RemoveColumsFromTestLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_lists, :test_num, :integer
    remove_reference :test_lists, :user, null: false, foreign_key: true
  end
end
