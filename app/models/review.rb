class Review < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :description, presence: true
  
  def self.search_review(params)
    where("LOWER(title) LIKE ?", "%#{params}%")
  end
end
