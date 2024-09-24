class AddTableModule < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.integer :difficulty, null: false, default: 0
      t.string :status, null: false

      t.timestamps
    end
  end
end
