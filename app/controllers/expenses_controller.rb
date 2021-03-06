class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Expense added."
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      flash[:notice] = "Expense updated."
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    if @expense.destroy
      flash[:notice] = "Expense deleted."
      redirect_to expense_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      redirect_to expense_path
    end
  end
end

private

def expense_params
  params.require(:expense).permit(:date, :category, :description, :amount)
end
