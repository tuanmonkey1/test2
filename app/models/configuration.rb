class Configuration < ApplicationRecord
	
  belongs_to :price

  validates :name, presence: true, length: { maximum: 48 }
  validates :content, presence: true, length: { maximum: 128 }
  validates :price_id, presence: true

end
