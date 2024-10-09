json.extract! expense, :id, :from_account, :from_account_name, :to_account, :to_account_name, :execution_date, :expense_date, :amount, :currency, :transaction_type, :communication, :details, :status, :reason_refused, :created_at, :updated_at
json.url expense_url(expense, format: :json)
