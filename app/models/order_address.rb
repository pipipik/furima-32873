class OrderAddress
  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,
                :image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, :user_id,
                :post_code, :city, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :address, :token
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
      validates :post_code
    end
    with_options numericality: { only_integer: true } do
      validates :phone_number
    end
  end
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end