class AddAmountToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :amount, :integer
  end
end
