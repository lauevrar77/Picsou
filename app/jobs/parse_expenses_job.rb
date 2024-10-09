class ParseExpensesJob < ApplicationJob
  queue_as :default

  def perform(adapter_name, account_name, file_path)
    raise "Invalid adapter" unless adapter_name == "BnpFortisCsv"

    expenses = Adapters::BnpFortisCsvAdapter.new(file_path, account_name).to_expenses
    ActiveRecord::Base.transaction do
      expenses.each do |expense|
        expense.save!
      end
    end
  end
end
