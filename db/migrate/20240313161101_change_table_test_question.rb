class ChangeTableTestQuestion < ActiveRecord::Migration[6.1]
  def change
    change_column :test_questions, :answer, :text
  end
end
