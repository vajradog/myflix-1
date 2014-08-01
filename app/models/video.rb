class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews , -> { order "created_at DESC" }

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    if search_term.blank?
      []
    else
      Video.where('title LIKE ?', "%#{search_term}%").order("created_at DESC")
    end
  end
  
  def average_rating
    average_rating = reviews.average(:rating).round(2) if reviews.average(:rating)
    average_rating
  end 
end

