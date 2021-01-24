class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :pay_infos

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  
  with_options presence: true do
  validates :nickname
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :birth_date

  end

  with_options format: { with: /^[ぁ-んァ-ヶー一-龠々]+$/, multiline: true, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
