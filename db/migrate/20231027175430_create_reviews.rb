class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :name
      t.text :degnities
      t.text :fault
      t.text :comment
      t.float :score
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
