require 'rest_client'

namespace :migrate do
  desc "Migrate quotes from old site"

  task quotes: :environment do
    response = RestClient.get 'http://ikonblvd.herokuapp.com/q.json'
    quotes = JSON.parse(response)

    quotes.each do |q|
      quote = Quote.new
      quote.description = q['description']
      quote.author = q['author']['name']
      quote.created_at = q['created_at']
      quote.updated_at = q['updated_at']
      quote.save!
      p "#{q['author_name']} saved!"
    end
  end

end
