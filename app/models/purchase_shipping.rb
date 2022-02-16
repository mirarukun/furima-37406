class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities,
   :house_number, :building_name, :telephone_number

   with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :telephone_number, format: {with:/\A\d{10,11}\z/}
   end

    validates :category_id ,numericality: { other_than: 0, message: "can't be blank" } 

  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number,
     building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end