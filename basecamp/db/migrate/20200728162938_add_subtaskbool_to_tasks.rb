class AddSubtaskboolToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :is_subtask, :boolean, :default => false
  end
end
