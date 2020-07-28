class AddSubtasksToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :parent
  end
end
