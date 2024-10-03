class AddAmountToRecurringExpense < ActiveRecord::Migration[7.2]
  def change
    add_column :recurring_expenses, :amount, :decimal
  end
end
