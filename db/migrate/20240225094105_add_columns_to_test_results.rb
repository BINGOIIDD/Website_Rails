class AddColumnsToTestResults < ActiveRecord::Migration[6.1]
  def change
    add_column :test_results, :question1, :integer
    add_column :test_results, :question2, :integer
    add_column :test_results, :question3, :integer
    add_column :test_results, :question4, :integer
    add_column :test_results, :question5, :integer
    add_column :test_results, :question6, :integer
    add_column :test_results, :question7, :integer
    add_column :test_results, :question8, :integer
    add_column :test_results, :question9, :integer
    add_column :test_results, :question10, :integer
  end
end
