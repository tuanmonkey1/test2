class Product < ApplicationRecord
  belongs_to :model

  validates :title, presence: true
  validates :description, presence: true

  scope :filter_by_macbook, ->{
  	joins(:model).merge(Model.macbook)
  }

  scope :filter_by_dell, ->{
  	joins(:model).merge(Model.dell)
  }

end
