class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :tel_num

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Must input include hyphen(-) in post code & harf size integer only' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'select' }
    validates :city
    validates :street
    validates :tel_num, format: { with: /\A(0{1}\d{0,10})\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, tel_num: tel_num,
                   order_id: order.id)
  end
end
