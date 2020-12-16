class Review < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :description, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
									message: "must be a valid image format" },
					   size:  	  { less_than: 5.megabytes,
									message: "should be less than 5MB" }
  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
