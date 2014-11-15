class AddLineToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :line, :integer
  end
end
