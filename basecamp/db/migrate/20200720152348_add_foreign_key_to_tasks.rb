class AddForeignKeyToTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :projects
  end
end
