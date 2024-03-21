class ChengeTableTestQuestion < ActiveRecord::Migration[6.1]
  def change
    change_table :test_questions do |t|
      t.remove :answers_list
    end
  end
end
