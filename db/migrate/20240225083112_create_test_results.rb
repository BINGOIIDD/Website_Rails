class CreateTestResults < ActiveRecord::Migration[6.1]
  def change
    create_table :test_results do |t|
      t.references :test_list, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :result

      t.timestamps
    end
  end
end
