class OrderForm 
  include ActiveModel::Model
  attr_accessor  :post_code, :region_id, :municipality, :street_address, :build_name, :phone_num
  attr_accessor  :item_id, :user_id 
  attr_accessor  :token 

  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :municipality,     presence: true
  validates :street_address,   presence: true
  validates :phone_num,        presence: true,  format: { with: /\A\d{10,11}\z/, message: "must be a valid phone number" }

  validates :item_id,          presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id,          presence: true
  validates :token,            presence: true

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do

      order = Order.create!(
        item_id:       item_id,
        user_id:       user_id
      )

      ship = Ship.create!(
        order_id:       order.id,
        post_code:      post_code,
        region_id:      region_id,
        municipality:   municipality,
        street_address: street_address,
        build_name:     build_name,
        phone_num:      phone_num
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => e 
    errors.add(:base, "Failed to save: #{e.message}")
    Rails.logger.error("Failed to save order or ship: #{e.message}")
    false
  end
end
