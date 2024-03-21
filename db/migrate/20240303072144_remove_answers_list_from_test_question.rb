class RemoveAnswersListFromTestQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_questions, :answers_list, :string
  end
end
