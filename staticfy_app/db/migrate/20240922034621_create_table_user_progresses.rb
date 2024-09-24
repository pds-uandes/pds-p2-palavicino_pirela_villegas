class CreateTableUserProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score, null: false, default: 0
      t.timestamps
    end
  end
end
