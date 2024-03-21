class ChangeColumnsTestResult < ActiveRecord::Migration[6.1]
  def change
    change_column :test_results, :question1, :text
    change_column :test_results, :question2, :text
    change_column :test_results, :question3, :text
    change_column :test_results, :question4, :text
    change_column :test_results, :question5, :text
    change_column :test_results, :question6, :text
    change_column :test_results, :question7, :text
    change_column :test_results, :question8, :text
    change_column :test_results, :question9, :text
    change_column :test_results, :question10, :text
  end
end
