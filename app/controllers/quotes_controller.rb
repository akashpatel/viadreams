class QuotesController < ApplicationController

  def index
    @quote = Quote.latest
  end

  def show
    @quote = Quote.find(params[:id])

    render 'index'
  end

end
