class TransportsController < ApplicationController
  before_action :find_transport, only: [:show]

  def index
    @transports = Transport.all
  end

  def show
  end

  private

  def find_transport
    @transport = Transport.find(params[:id])
  end
end
