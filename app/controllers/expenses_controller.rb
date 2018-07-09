class ExpensesController < ApplicationController
  before_action :find_transport, only: [:new, :create]
  def new
    @expense = @transport.expenses.build
  end

  def create
    @expense = @transport.expenses.build(expense_params)

    if @expense.save
      redirect_to transport_path(params[:transport_id])
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :mileage, :kind, :description, :amount)
  end

  def find_transport
    @transport = Transport.find(params[:transport_id])
  end
end
