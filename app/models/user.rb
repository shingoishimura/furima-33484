class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英文字と半角数字を使用する形で設定して下さい'

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  with_options format: { with: /^[ぁ-んァ-ヶー一-龠々]+$/, multiline: true, message: 'は全角で入力して下さい' } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力して下さい' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
