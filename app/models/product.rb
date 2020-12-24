class Product < ApplicationRecord
  belongs_to :model

  validates :title, presence: true
  validates :description, presence: true
  validates :model_id, presence: true

  def self.search_by_title(title)
    where("LOWER(title) LIKE ?", "%#{title}%")
  end

  scope :filter_by_macbook, ->{
  	joins(:model).merge(Model.macbook)
  }

  scope :filter_by_dell, ->{
  	joins(:model).merge(Model.dell)
  }

end
