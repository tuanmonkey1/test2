class Model < ApplicationRecord
  belongs_to :brand
  has_many :products

  validates :name, presence: true
end
