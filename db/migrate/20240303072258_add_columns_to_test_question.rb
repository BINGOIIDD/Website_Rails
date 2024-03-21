class AddColumnsToTestQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :test_questions, :answers_list_1, :string
    add_column :test_questions, :answers_list_2, :string
    add_column :test_questions, :answers_list_3, :string
    add_column :test_questions, :answers_list_4, :string
  end
end
