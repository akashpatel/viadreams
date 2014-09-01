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

  def update_likes
    @quote = Quote.find(params[:id])
    @quote.likes = 0 if @quote.likes.blank?
    @quote.likes = @quote.likes+1

    if @quote.save!
      render json: @quote, status: :ok
    else
      render json: @quote, status: :unprocessable_entity
    end

  end

end
