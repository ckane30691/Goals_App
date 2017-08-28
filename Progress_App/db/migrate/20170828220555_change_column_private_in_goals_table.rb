class ChangeColumnPrivateInGoalsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :goals, :private
    add_column :goals, :private_goal?, :boolean, default: false
    remove_column :goals, :completed
    add_column :goals, :completed?, :boolean, default: false
  end
end
