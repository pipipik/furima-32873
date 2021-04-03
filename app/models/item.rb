class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image, :name, :info
    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
    end
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      validates :price
    end
  end


end
