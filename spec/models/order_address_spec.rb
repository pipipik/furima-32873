require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  it 'すべての値が正しく入力されていれば保存できること' do
  end
  it 'post_codeが空だと保存できないこと' do
    @order_address.post_code = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code can't be blank")
  end
  it 'post_codeにはハイフンが必要であること' do
    @order_address.post_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
  end
  it 'prefectureの値が1では登録できない' do
    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include ("Prefecture must be other than 1")
  end
  it 'cityが空だと保存できないこと' do
    @order_address.city = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end
  it 'addressが空だと保存できないこと' do
    @order_address.address = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'building_nameは空でも保存できること' do
    @order_address.building_name = ''
    expect(@order_address).to be_valid
  end
  it 'phone_numberが空だと保存できないこと' do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが全角数字だと保存できないこと' do
    @order_address.phone_number = '０９０１２３４５６７８'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone number is not a number')
  end
  it "tokenが空では登録できないこと" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
end