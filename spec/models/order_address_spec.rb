require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にはハイフンがないと保存できないこと' do
      @order_address.post_code = '4260015'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code Must input include hyphen(-) in post code")
    end

    it '電話番号が空だと保存できないこと' do
      @order_address.tel_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel num can't be blank")
    end
    
    it '電話番号にはハイフン不要であること' do
      @order_address.tel_num = 054-000-0000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel num is invalid")
    end

    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture select')
    end
    it '市町村が空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_address.street = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street can't be blank")
    end
  end
end
