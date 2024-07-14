class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition 
  belongs_to_active_hash :burden
  belongs_to_active_hash :region
  belongs_to_active_hash :days_until_delivery 
  has_one :order 

  validate :image_presence

  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_until_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
 
  private
  
  def image_presence
    errors.add(:image, "must be attached") unless image.attached?
  end

end
