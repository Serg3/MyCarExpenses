class TransportsController < ApplicationController
  before_action :find_transport, only: [:show]

  def index
    @transports = Transport.all
  end

  def show
    @expenses = @transport.expenses
  end

  def new
    @transport = Transport.new
  end

  def create
    @transport = Transport.new(transport_params)

    if @transport.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_transport
    @transport = Transport.find(params[:id])
  end

  def transport_params
    params.require(:transport).permit(:name, :mark, :model, :edition_year)
  end
end
