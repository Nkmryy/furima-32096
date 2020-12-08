require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_address).to be_valid
  end
  it 'bulidingは空でも保存できること' do
    @order_address.building = nil
    expect(@order_address).to be_valid
  end

  it 'postal_codeが空だと保存できないこと' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @order_address.postal_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end
  it 'state_idが空だとと保存できないこと' do
    @order_address.state_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("State can't be blank")
  end
  it 'state_idを選択していないと保存できないこと' do
    @order_address.state_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("State can't be blank")
  end
  it 'addressが空だと保存できないこと' do
    @order_address.address = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'streetが空だと保存できないこと' do
    @order_address.street = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Street can't be blank")
  end
  it 'phoneが空だと保存できないこと' do
    @order_address.phone = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone can't be blank")
  end
  it 'phoneが11桁以上だと保存できないこと' do
    @order_address.phone = '012345678901'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone is invalid. In 11 digits or less numbers')
  end
  it 'phoneに数字以外の文字列が含まれている場合購入できない' do
    @order_address.phone = 'abc00000000'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone is invalid. In 11 digits or less numbers')
  end
  it 'tokenが空だと保存できないこと' do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  it 'user_idが空だと保存できないこと' do
    @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
  end
  it 'item_idが空だと保存できないこと' do
    @order_address.item_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Item can't be blank")
  end
end
