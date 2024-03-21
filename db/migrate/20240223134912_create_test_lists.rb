class CreateTestLists < ActiveRecord::Migration[6.1]
  def change
    create_table :test_lists do |t|
      t.string :test_name
      t.references :user, null: false, foreign_key: true
      t.integer :test_num

      t.timestamps
    end
  end
end
