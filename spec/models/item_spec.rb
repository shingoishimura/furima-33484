require 'rails_helper'

RSpec.describe 'Item', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '出品画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と配送先の地域と配送までの日数と販売価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき'
    it 'item_nameが空では保存できないこと' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'textが空では保存できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("説明を入力してください")
    end

    it 'category_idが1では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力して下さい")
    end
    it 'status_idが1では保存できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力して下さい")
    end
    it 'send_fee_idが1では保存できないこと' do
      @item.send_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力して下さい")
    end
    it 'prefecture_id が1では保存できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力して下さい")
    end

    it 'send_period_id が1では保存できないこと' do
      @item.send_period_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送までの日数を入力して下さい")
    end

    it 'price が空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end

    it 'priceが299以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます')
    end

    it 'priceが10,000,000以上では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます')
    end

    it 'priceが半角数字以外では登録できないこと' do
      @item.price = '３３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます')
    end

    it '半角英数混合では登録できないこと' do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます')
    end

    it '半角英語だけでは登録できないこと' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます')
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end
  end
end
