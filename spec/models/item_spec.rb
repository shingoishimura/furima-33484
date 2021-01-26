require 'rails_helper'

RSpec.describe 'Item', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end