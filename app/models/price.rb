class Price < ApplicationRecord

  belongs_to :product
  has_many :configurations, dependent: :destroy

  validates :price, presence: true
  validates :product_id, presence: true

end
