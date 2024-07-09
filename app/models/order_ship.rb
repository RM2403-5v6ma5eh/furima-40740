class OrderShip 
  include ActiveModel::Model
  attr_accessor  :post_code, :region_id, :municipality, :street_address, :phone_num

  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :municipality,     presence: true
  validates :street_address,   presence: true
  validates :phone_num,        presence: true,  format: { with: /\A\d{10,11}\z/, message: "must be a valid phone number" }


  
end


# class OrderForm
#  include ActiveModel::Model

#  attr_accessor :ship_name, :ship_address, :ship_phone, :item_id, :quantity
#  attr_reader :user_id  # ユーザーIDはセットされる前提で読み取り専用に設定

#  validates :ship_name, :ship_address, :ship_phone, presence: true
#  validates :item_id, :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

#  def initialize(user_id, item_id)
#    @user_id = user_id
#    @item_id = item_id
#  end

#  def save
#    return false unless valid?

#    ActiveRecord::Base.transaction do
#      ship = Ship.create!(
#        name: ship_name,
#        address: ship_address,
#        phone: ship_phone,
#        user_id: user_id
#      )

#      order = Order.create!(
#        user_id: user_id,
#        item_id: item_id,
#        quantity: quantity,
#        ship_id: ship.id
#      )

      # その他の処理（例えば在庫の更新など）

#      true
#    rescue ActiveRecord::RecordInvalid => e
#      errors.add(:base, "An error occurred: #{e.message}")
#      false
#    end
#  end
# end
  