class CreateTableMultiChoiceAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :multi_choice_answers do |t|
      t.references :user, foreign_key: true
      t.references :multi_choice_questions, foreign_key: true
      t.string :selected_choice, null: false
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
