class RemoveColumsFromTestQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_questions, :test_num, :integer
    remove_reference :test_questions, :user, null: false, foreign_key: true
  end
end
