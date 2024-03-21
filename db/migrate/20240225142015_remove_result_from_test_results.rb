class RemoveResultFromTestResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_results, :result, :integer
  end
end
