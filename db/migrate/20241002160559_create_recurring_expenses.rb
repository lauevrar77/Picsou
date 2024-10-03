class CreateRecurringExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :recurring_expenses do |t|
      t.string :name
      t.date :begin_date
      t.string :periodicity

      t.timestamps
    end
  end
end
