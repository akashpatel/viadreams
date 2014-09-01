class QuotesController < ApplicationController

  def index
    ids = Quote.pluck(:id)
    @quote = Quote.random
  end

  def show
    @quote = Quote.find(params[:id])

    render 'index'
  end

  def random
    @quote = Quote.random

    respond_to do |format|
      format.html  { redirect_to root_path }
      format.json  { render json: @quote }
    end
  end

end
