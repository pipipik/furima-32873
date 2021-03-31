require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it 'image, name, info, category_id, status_id, shipping_fee_id, prefecture_id, scheduled_delivery_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceの値がが300以上9999999以下かつ半角数字であれば登録できる' do
        @item.price = '500'
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Info can't be blank")
      end
      it 'category_idの値が1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it 'status_idの値が1では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status must be other than 1")
      end
      it 'shipping_fee_idの値が1では登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee must be other than 1")
      end
      it 'prefecture_idの値が1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture must be other than 1")
      end
      it 'scheduled_delivery_idの値が1では登録できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Scheduled delivery must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceの値が300未満では登録できない' do
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceの値が10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角では登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
