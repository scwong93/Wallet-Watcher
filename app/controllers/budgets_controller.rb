class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      flash[:notice] = "Budget saved."
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def update
    @budget = Budget.find(params[:id])

    if @budget.update(budget_params)
      flash[:notice] = "Budget updated."
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end
end

private

def budget_params
  params.require(:budget).permit(:amount)
end
