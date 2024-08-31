class CreateTableMultiChoiceQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :multi_choice_questions do |t|
      t.references :task, foreign_key: true
      t.integer :difficulty, null: false, default: 0
      t.string :question, null: false
      t.string :choice_1, null: false
      t.string :choice_2, null: false
      t.string :choice_3, null: true
      t.string :choice_4, null: true
      t.string :correct_answer, null: false
      t.timestamps
    end
  end
end
