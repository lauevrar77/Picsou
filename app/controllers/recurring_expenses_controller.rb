class RecurringExpensesController < ApplicationController
  before_action :set_recurring_expense, only: %i[ show edit update destroy ]

  # GET /recurring_expenses or /recurring_expenses.json
  def index
    today = Date.today
    @recurring_expenses = RecurringExpense.all.select {|expense| expense.next_occurence >= today }.sort_by {|expense| expense.next_occurence }
    @total = @recurring_expenses.sum {|expense| expense.amount}
    @total_by_month = Hash.new(0.to_d)
    @recurring_expenses.each do |expense|
      month = "#{expense.next_occurence.month}/#{expense.next_occurence.year}"
      @total_by_month[month] += expense.amount
    end
  end

  # GET /recurring_expenses/1 or /recurring_expenses/1.json
  def show
  end

  # GET /recurring_expenses/new
  def new
    @recurring_expense = RecurringExpense.new
  end

  # GET /recurring_expenses/1/edit
  def edit
  end

  # POST /recurring_expenses or /recurring_expenses.json
  def create
    @recurring_expense = RecurringExpense.new(recurring_expense_params)

    respond_to do |format|
      if @recurring_expense.save
        format.html { redirect_to @recurring_expense, notice: "Recurring expense was successfully created." }
        format.json { render :show, status: :created, location: @recurring_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurring_expenses/1 or /recurring_expenses/1.json
  def update
    respond_to do |format|
      if @recurring_expense.update(recurring_expense_params)
        format.html { redirect_to @recurring_expense, notice: "Recurring expense was successfully updated." }
        format.json { render :show, status: :ok, location: @recurring_expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recurring_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_expenses/1 or /recurring_expenses/1.json
  def destroy
    @recurring_expense.destroy!

    respond_to do |format|
      format.html { redirect_to recurring_expenses_path, status: :see_other, notice: "Recurring expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_expense
      @recurring_expense = RecurringExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recurring_expense_params
      params.require(:recurring_expense).permit(:name, :begin_date, :periodicity, :amount)
    end
end
