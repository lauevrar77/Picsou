# == Schema Information
#
# Table name: recurring_expenses
#
#  id          :integer          not null, primary key
#  amount      :decimal(, )
#  begin_date  :date
#  name        :string
#  periodicity :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class RecurringExpense < ApplicationRecord
  has_many :person_recurring_expenses
  has_many :persons, through: :person_recurring_expenses

  def next_occurence
    return begin_date if periodicity == 'never'

    next_occurence = begin_date
    today = Date.today
    to_add = 1.day
    case periodicity
    when 'yearly'
      to_add = 1.year
    when 'monthly'
      to_add = 1.month
    end

    while next_occurence < today
      next_occurence += to_add
    end
    next_occurence
  end
end
