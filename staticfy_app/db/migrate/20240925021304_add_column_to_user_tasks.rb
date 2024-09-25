class AddColumnToUserTasks < ActiveRecord::Migration[7.1]
  def change
    add_index :user_tasks, [:user_id, :task_id], unique: true
    add_column :user_tasks, :wrong_counter, :integer
    remove_column :tasks, :wrong_counter, :integer
  end
end
