class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.string :from_account
      t.string :from_account_name
      t.string :to_account
      t.string :to_account_name
      t.date :execution_date
      t.date :expense_date
      t.decimal :amount
      t.string :currency
      t.string :transaction_type
      t.text :communication
      t.text :details
      t.string :status
      t.string :reason_refused

      t.timestamps
    end
  end
end
