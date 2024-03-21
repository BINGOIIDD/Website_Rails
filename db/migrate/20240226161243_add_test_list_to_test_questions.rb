class AddTestListToTestQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_questions, :test_list, null: false, foreign_key: true
  end
end
