class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefecture, :municipalities,
   :house_number, :building, :telephone_number, :purchase

   with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :municipalities
    validates :house_number
    validates :telephone_number
    validates :purchase
   end

  def save
    Purchase.create(user: user,item: item)
    Shipping.create(post_code: post_code, prefecture: prefecture, municipalities: municipalities, house_number: house_number,
     building: building, telephone_number: telephone_number, purchase: purchase)
  end
end