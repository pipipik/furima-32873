class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :address, :token, :user_id, :item_id
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
      validates :post_code
    end
    with_options format: { with: /\A\d{10}$|^\d{11}\z/ } do
      validates :phone_number
    end
  end
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end