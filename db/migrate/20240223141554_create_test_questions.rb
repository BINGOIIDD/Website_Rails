class CreateTestQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :test_questions do |t|
      t.integer :test_num
      t.references :user, null: false, foreign_key: true
      t.string :question
      t.string :answers_list
      t.integer :answer

      t.timestamps
    end
  end
end
