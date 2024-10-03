require "test_helper"

class RecurringExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurring_expense = recurring_expenses(:one)
  end

  test "should get index" do
    get recurring_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_recurring_expense_url
    assert_response :success
  end

  test "should create recurring_expense" do
    assert_difference("RecurringExpense.count") do
      post recurring_expenses_url, params: { recurring_expense: { begin_date: @recurring_expense.begin_date, name: @recurring_expense.name, periodicity: @recurring_expense.periodicity } }
    end

    assert_redirected_to recurring_expense_url(RecurringExpense.last)
  end

  test "should show recurring_expense" do
    get recurring_expense_url(@recurring_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_recurring_expense_url(@recurring_expense)
    assert_response :success
  end

  test "should update recurring_expense" do
    patch recurring_expense_url(@recurring_expense), params: { recurring_expense: { begin_date: @recurring_expense.begin_date, name: @recurring_expense.name, periodicity: @recurring_expense.periodicity } }
    assert_redirected_to recurring_expense_url(@recurring_expense)
  end

  test "should destroy recurring_expense" do
    assert_difference("RecurringExpense.count", -1) do
      delete recurring_expense_url(@recurring_expense)
    end

    assert_redirected_to recurring_expenses_url
  end
end
