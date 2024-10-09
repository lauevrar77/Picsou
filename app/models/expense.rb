# == Schema Information
#
# Table name: expenses
#
#  id                :integer          not null, primary key
#  amount            :decimal(, )
#  communication     :text
#  currency          :string
#  details           :text
#  execution_date    :date
#  expense_date      :date
#  from_account      :string
#  from_account_name :string
#  reason_refused    :string
#  status            :string
#  to_account        :string
#  to_account_name   :string
#  transaction_type  :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Expense < ApplicationRecord
end
