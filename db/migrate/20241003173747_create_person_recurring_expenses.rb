class CreatePersonRecurringExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :person_recurring_expenses do |t|
      t.references :recurring_expense, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
