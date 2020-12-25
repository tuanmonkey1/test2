class Model < ApplicationRecord
  belongs_to :brand
  has_many :products

  validates :name, presence: true
  validates :brand_id, presence: true

  enum brand: { macbook: 1, surface: 2, dell: 3, hp: 4, razer: 5, acer: 6, asus: 7, lenovo: 8, lg: 9, msi: 10 }

end
