class AddFieldsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :name, :string, null: false
    add_column :tasks, :is_finished, :boolean, null: false, default: false
    add_column :tasks, :wrong_counter, :integer
  end
end
