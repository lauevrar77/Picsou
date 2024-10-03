# == Schema Information
#
# Table name: person_recurring_expenses
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  person_id            :integer          not null
#  recurring_expense_id :integer          not null
#
# Indexes
#
#  index_person_recurring_expenses_on_person_id             (person_id)
#  index_person_recurring_expenses_on_recurring_expense_id  (recurring_expense_id)
#
# Foreign Keys
#
#  person_id             (person_id => people.id)
#  recurring_expense_id  (recurring_expense_id => recurring_expenses.id)
#
class PersonRecurringExpense < ApplicationRecord
  belongs_to :person
  belongs_to :recurring_expense
end
