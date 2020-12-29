class Product < ApplicationRecord

  belongs_to :model
  has_many :prices, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :model_id, presence: true

  scope :filter_by_macbook, ->{
  	joins(:model).merge(Model.macbook)
  }

  scope :filter_by_dell, ->{
  	joins(:model).merge(Model.dell)
  }

end
