class EntriesController < ApplicationController
  respond_to :json

  def index
    respond_with Entry.all
  end

  def show
    respond_with Entry.find(params[:id])
  end

  def create
    respond_with Entry.find(params[:entry])
  end

  def update
    respond_with Entry.find(params[:id], params[:entry])
  end

  def destroy
    respond_with Entry.find(params[:id])
  end
end
