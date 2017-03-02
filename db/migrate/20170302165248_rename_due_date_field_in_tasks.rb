class RenameDueDateFieldInTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :due_date, :dueDate
  end
end
