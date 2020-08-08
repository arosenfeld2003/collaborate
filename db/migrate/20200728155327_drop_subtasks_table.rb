class DropSubtasksTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :subtasks do |t|
      t.string :title, null: false
      t.timestamps null: false
    end
  end
end
