class Item < ApplicationRecord

  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_until_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
