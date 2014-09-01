class QuotesController < ApplicationController

  def index
    @quote = Quote.latest
  end

end
