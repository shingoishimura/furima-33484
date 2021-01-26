class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :send_fee
  belongs_to :send_period

  belongs_to :user
  has_one_attached :image

  validates :image, :item_name, :text, :price, presence: true
  validates :price, numericality: {greater_than: 300,less_than:10000000 }


  validates :category_id, :state_id, :send_fee_id, :prefecture_id, numericality: { other_than: 1 }
  validates :send_period_id, numericality: { other_than: 0 }
end
