class RemoveColumnTestQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_questions, :answers_list
  end
end
