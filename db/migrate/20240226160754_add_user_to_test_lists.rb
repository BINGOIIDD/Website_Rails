class AddUserToTestLists < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_lists, :user, null: false, foreign_key: true
  end
end
