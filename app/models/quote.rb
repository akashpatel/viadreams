class Quote < ActiveRecord::Base

  scope :latest, -> { self.last }

  def missing_author_wallpaper
    google_image_keywords = ['san francisco city', 'chicago city', 'new york city', 'bora bora', 'top 10 exotic places']
    google_image_keywords.sample

  end

end
