class AddResultToTestResults < ActiveRecord::Migration[6.1]
  def change
    add_column :test_results, :result, :integer
  end
end
