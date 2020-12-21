class Product < ApplicationRecord
  belongs_to :model

  validates :title, presence: true
  validates :description, presence: true
end
