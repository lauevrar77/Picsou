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
require "test_helper"

class RecurringExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
