require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '正しく入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idの値が0だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idの値が0だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'which_one_idが空だと出品できない' do
        @item.which_one_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Which one can't be blank")
      end
      it 'which_one_idの値が0だと出品できない' do
        @item.which_one_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Which one can't be blank")
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が0だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_idが空だと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'days_idの値が0だと出品できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは数字じゃないと出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは全角で入力すると出品できない' do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
