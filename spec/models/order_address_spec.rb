require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
      @order_address.user_id = FactoryBot.build(:user)
      @order_address.item_id = FactoryBot.build(:item)
    
    end

    context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '建物名が無い場合も登録できる' do
      @order_address.building = nil
      expect(@order_address).to be_valid
   end
  end

    context '内容に問題がある場合' do
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
      expect(@order_address.errors.full_messages).to include('Post code Must input include hyphen(-) in post code')
    end

    it '電話番号が空だと保存できないこと' do
      @order_address.tel_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel num can't be blank")
    end

    it '電話番号にはハイフン不要であること' do
      @order_address.tel_num ='054-000-0000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Tel num is invalid')
    end

    it '電話番号は11桁以下であること' do
      @order_address.tel_num = '0000000000000000000'
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
end
end