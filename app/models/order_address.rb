class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :tel_num

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は-（ハイフン）と半角数字を入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選んで下さい' }
    validates :city
    validates :street
    validates :tel_num, format: { with: /\A(0{1}\d{0,10})\z/, message: 'は11桁以下半角数字で-（ハイフン）は不要です' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, tel_num: tel_num,
                   order_id: order.id)
  end
end
