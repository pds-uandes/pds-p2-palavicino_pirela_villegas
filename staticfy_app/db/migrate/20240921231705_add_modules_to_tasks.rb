class AddModulesToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :course, foreign_key: true

  end
end
