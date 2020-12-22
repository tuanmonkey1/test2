class Model < ApplicationRecord
  belongs_to :brand
  has_many :products

  validates :name, presence: true

  scope :macbook, ->{ where(brand_id: 1) }

  scope :dell, ->{ where(brand_id: 3) }
end
