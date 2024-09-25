class AddUniqueIndexToUserProgressXd < ActiveRecord::Migration[6.0]
  def change
    add_index :user_progresses, [:user_id, :score], unique: true
  end
end
