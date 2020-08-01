class AddIsParentToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :is_parent, :boolean, :default => false
  end
end
