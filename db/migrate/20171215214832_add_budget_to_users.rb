class AddBudgetToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :budget, :integer
  end
end
