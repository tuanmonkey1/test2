class Model < ApplicationRecord
  belongs_to :brand
  has_many :products

  validates :name, presence: true

  enum brand_id: { macbook: 1, surface: 2, dell: 3, razer: 4, asus: 5, lg: 6, hp: 7, acer: 8, lenovo: 9, msi: 10 }

end
