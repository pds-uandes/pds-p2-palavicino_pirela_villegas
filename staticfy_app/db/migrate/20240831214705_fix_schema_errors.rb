class FixSchemaErrors < ActiveRecord::Migration[7.1]
  def change
    # Cambiar nombres de foreign keys a singular
    rename_column :multi_choice_answers, :multi_choice_questions_id, :multi_choice_question_id
    rename_column :numeric_answers, :numeric_questions_id, :numeric_question_id
    rename_column :numeric_templates, :numeric_questions_id, :numeric_question_id

    # Corregir tolerance
    rename_column :numeric_questions, :toleranc, :tolerance

    # Verificar que las nuevas foreign keys esten correctamente asociadas
    remove_foreign_key :multi_choice_answers, :multi_choice_questions
    add_foreign_key :multi_choice_answers, :multi_choice_questions, column: :multi_choice_question_id

    remove_foreign_key :numeric_answers, :numeric_questions
    add_foreign_key :numeric_answers, :numeric_questions, column: :numeric_question_id

    remove_foreign_key :numeric_templates, :numeric_questions
    add_foreign_key :numeric_templates, :numeric_questions, column: :numeric_question_id
  end
end
