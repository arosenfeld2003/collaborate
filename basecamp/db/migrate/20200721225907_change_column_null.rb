class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :completed, false
    change_column_default :tasks, :completed, false
  end
end
