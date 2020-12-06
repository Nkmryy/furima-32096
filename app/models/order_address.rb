class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :address, :street, :building, :phone, :token, :item_id, :user_id, :price, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address
    validates :street
    validates :phone, format: {with: /\A[0-9]{,11}\z/, message: "is invalid. In 11 digits or less"}
    validates :token
    validates :price
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, state_id: state_id, address: address, street: street, building: building, phone: phone, order_id: order.id)
  end
end