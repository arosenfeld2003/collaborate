class AddAuthorToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :author, :string
  end
end
