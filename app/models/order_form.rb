class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :block_number, :apartment_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    #validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, block_number: block_number, apartment_name: apartment_name, phone_number: phone_number)
  end
end