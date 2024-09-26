class AddColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :difficulty, :integer, default: 1
  end
end
