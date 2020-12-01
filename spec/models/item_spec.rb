require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '出品がうまくいくとき' do
        it "必要な値が存在すれば登録できる" do
          expect(@item).to be_valid 
        end
        it "priceが300以上であれば登録できる" do
          @item.price = "300"
          expect(@item).to be_valid 
        end
        it "priceが9999999以下であれば登録できる" do
          @item.price = "9999999"
          expect(@item).to be_valid 
        end
      end

      context '出品がうまくいかないとき' do
        it "nameが空だと出品できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end
        it "decriptionが空では出品できない" do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Description can't be blank"
        end
        it "priceが空では出品できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end
        it "priceが全角では出品できない" do
          @item.price = "１２３４"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
        it "priceが299以下では出品できない" do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be greater than 299"
        end
        it "priceが10000000以上では出品できない" do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be less than 10000000"
        end
        it "imageがなければ出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end
        it "category_idが空では出品できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "category_idが１の場合は出品できない" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 1"
        end
        it "status_idが空では出品できない" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Status can't be blank"
        end
        it "status_idが１の場合は出品できない" do
          @item.status_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Status must be other than 1"
        end
        it "freight_idが空では出品できない" do
          @item.freight_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Freight can't be blank"
        end
        it "freight_idが１の場合は出品できない" do
          @item.freight_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Freight must be other than 1"
        end
        it "ship_state_idが空では出品できない" do
          @item.ship_state_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Ship state can't be blank"
        end
        it "ship_state_idが１の場合は出品できない" do
          @item.ship_state_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Ship state must be other than 1"
        end
        it "ship_day_idが空では出品できない" do
          @item.ship_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Ship day can't be blank"
        end
        it "ship_day_idが１の場合は出品できない" do
          @item.ship_day_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Ship day must be other than 1"
        end
        it 'userが紐付いていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end
      end
    end
  end
end