class ChangeGoalColumnsAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column :goals, :completed?
    remove_column :goals, :private_goal?

    add_column :goals, :completed, :boolean, default: true
    add_column :goals, :is_private, :boolean, default: true
  end
end
