require "application_system_test_case"

class RecurringExpensesTest < ApplicationSystemTestCase
  setup do
    @recurring_expense = recurring_expenses(:one)
  end

  test "visiting the index" do
    visit recurring_expenses_url
    assert_selector "h1", text: "Recurring expenses"
  end

  test "should create recurring expense" do
    visit recurring_expenses_url
    click_on "New recurring expense"

    fill_in "Begin date", with: @recurring_expense.begin_date
    fill_in "Name", with: @recurring_expense.name
    fill_in "Periodicity", with: @recurring_expense.periodicity
    click_on "Create Recurring expense"

    assert_text "Recurring expense was successfully created"
    click_on "Back"
  end

  test "should update Recurring expense" do
    visit recurring_expense_url(@recurring_expense)
    click_on "Edit this recurring expense", match: :first

    fill_in "Begin date", with: @recurring_expense.begin_date
    fill_in "Name", with: @recurring_expense.name
    fill_in "Periodicity", with: @recurring_expense.periodicity
    click_on "Update Recurring expense"

    assert_text "Recurring expense was successfully updated"
    click_on "Back"
  end

  test "should destroy Recurring expense" do
    visit recurring_expense_url(@recurring_expense)
    click_on "Destroy this recurring expense", match: :first

    assert_text "Recurring expense was successfully destroyed"
  end
end
