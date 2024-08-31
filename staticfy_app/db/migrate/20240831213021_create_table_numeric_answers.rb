class CreateTableNumericAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :numeric_answers do |t|
      t.references :user, foreign_key: true
      t.references :numeric_questions, foreign_key: true
      t.string :content, null: false
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
