require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 1
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
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it '郵便番号が空だと保存できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号にはハイフンがないと保存できないこと' do
        @order_address.post_code = '4260015'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は-（ハイフン）と半角数字を入力して下さい')
      end
      it '郵便番号が全角数字だと保存できないこと' do
        @order_address.post_code = '４２６−００１５'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は-（ハイフン）と半角数字を入力して下さい')
      end
      it '電話番号が空だと保存できないこと' do
        @order_address.tel_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号にはハイフン不要であること' do
        @order_address.tel_num = '054-000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以下半角数字で-（ハイフン）は不要です')
      end

      it '電話番号は11桁以下であること' do
        @order_address.tel_num = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以下半角数字で-（ハイフン）は不要です')
      end
      it '電話番号は全角数字だと登録できないこと' do
        @order_address.tel_num = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11桁以下半角数字で-（ハイフン）は不要です')
      end
      it '都道府県が空だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選んで下さい')
      end
      it '市町村が空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市町村を入力してください')
      end
      it '番地が空だと保存できないこと' do
        @order_address.street = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('丁目番地を入力してください')
      end
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
