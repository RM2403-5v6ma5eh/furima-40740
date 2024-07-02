class Item < ApplicationRecord

  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one_attached :image

  validate :image_presence

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_until_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :user, presence: true 

  private
  
  def image_presence
    errors.add(:image, "must be attached") unless image.attached?
  end

end
