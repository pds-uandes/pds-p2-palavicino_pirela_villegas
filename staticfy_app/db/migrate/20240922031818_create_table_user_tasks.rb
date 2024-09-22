class CreateTableUserTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :is_finished, null: false, default: false

      t.timestamps

    end
  end
end
