require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @expense = expenses(:one)
  end

  test "visiting the index" do
    visit expenses_url
    assert_selector "h1", text: "Expenses"
  end

  test "should create expense" do
    visit expenses_url
    click_on "New expense"

    fill_in "Amount", with: @expense.amount
    fill_in "Communication", with: @expense.communication
    fill_in "Currency", with: @expense.currency
    fill_in "Details", with: @expense.details
    fill_in "Execution date", with: @expense.execution_date
    fill_in "Expense date", with: @expense.expense_date
    fill_in "From account", with: @expense.from_account
    fill_in "From account name", with: @expense.from_account_name
    fill_in "Reason refused", with: @expense.reason_refused
    fill_in "Status", with: @expense.status
    fill_in "To account", with: @expense.to_account
    fill_in "To account name", with: @expense.to_account_name
    fill_in "Transaction type", with: @expense.transaction_type
    click_on "Create Expense"

    assert_text "Expense was successfully created"
    click_on "Back"
  end

  test "should update Expense" do
    visit expense_url(@expense)
    click_on "Edit this expense", match: :first

    fill_in "Amount", with: @expense.amount
    fill_in "Communication", with: @expense.communication
    fill_in "Currency", with: @expense.currency
    fill_in "Details", with: @expense.details
    fill_in "Execution date", with: @expense.execution_date
    fill_in "Expense date", with: @expense.expense_date
    fill_in "From account", with: @expense.from_account
    fill_in "From account name", with: @expense.from_account_name
    fill_in "Reason refused", with: @expense.reason_refused
    fill_in "Status", with: @expense.status
    fill_in "To account", with: @expense.to_account
    fill_in "To account name", with: @expense.to_account_name
    fill_in "Transaction type", with: @expense.transaction_type
    click_on "Update Expense"

    assert_text "Expense was successfully updated"
    click_on "Back"
  end

  test "should destroy Expense" do
    visit expense_url(@expense)
    click_on "Destroy this expense", match: :first

    assert_text "Expense was successfully destroyed"
  end
end
