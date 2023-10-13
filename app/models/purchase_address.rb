class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :street_address, :building, :item_id, :user_id, :telephone_number, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is enter a half-width numeric value with 10 to 11 digits" }
    validates :token
  end

  validates :region_id, numericality: {other_than: 1, message: "can't be blank"}

  def save

    purchase = Purchase.create(item_id: item_id, user_id: user_id)
  
    Address.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end