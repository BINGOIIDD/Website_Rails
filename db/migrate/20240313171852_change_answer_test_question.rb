class ChangeAnswerTestQuestion < ActiveRecord::Migration[6.1]
  def change
    change_column :test_questions, :answer, :integer
  end
end
