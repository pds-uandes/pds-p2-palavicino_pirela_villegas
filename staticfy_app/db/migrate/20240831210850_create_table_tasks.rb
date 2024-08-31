class CreateTableTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :task_type, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
