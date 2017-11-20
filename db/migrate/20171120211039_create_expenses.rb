class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.string :category
      t.text :description
      t.integer :amount

      t.timestamps
    end
  end
end
