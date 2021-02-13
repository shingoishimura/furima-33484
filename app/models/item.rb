class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :send_fee
  belongs_to :send_period

  belongs_to :user

  has_one :order
  has_one_attached :image

  validates :image, :item_name, :text, :price, presence: true
  validates :price,
            numericality: { with: /\A[0-9]+\z/, greater_than: 300, less_than: 10_000_000,
                            message: 'は300円から9,999,999円の範囲で入力してください,また半角数字のみ入力できます' }

  with_options numericality: { other_than: 1, message: 'を入力して下さい' } do
    validates :category_id
    validates :state_id
    validates :send_fee_id
    validates :prefecture_id
    validates :send_period_id
  end
end
