class CreateTableNumericTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :numeric_templates do |t|
      t.references :numeric_questions, foreign_key: true
      t.string :diagram_data, null: false
      t.string :values, null: false
      t.string :magnitudes, null: false

      t.timestamps
    end
  end
end
