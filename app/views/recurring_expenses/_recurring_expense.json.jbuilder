json.extract! recurring_expense, :id, :name, :begin_date, :periodicity, :created_at, :updated_at
json.url recurring_expense_url(recurring_expense, format: :json)
