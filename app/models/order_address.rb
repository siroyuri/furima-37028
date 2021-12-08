class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Input example(123-4567)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "is too short" }
    validates :phone_number, numericality: { only_integer: true , message: "is invalid. Input example(09012345678)" }
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, 
      building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end
