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
    @expense = Expense.new

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

    if @expense.save
      flash[:notice] = "Expense updated."
      redirect_to index_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    if @expense.destroy
      flash[:notice] = "Expense deleted."
      redirect_to index_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      redirect_to index_path
    end
  end
end
