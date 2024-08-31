class CreateTableNumericQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :numeric_questions do |t|
      t.references :task, foreign_key: true
      t.integer :difficulty, null: false, default: 0
      t.string :question, null: false
      t.string :correct_answer, null: false
      t.float :toleranc, null: false
      t.string :unit, null: false
      t.string :hint_1, null: false
      t.string :hint_2, null: false
      t.string :hint_3, null: false
      t.timestamps
    end
  end
end
