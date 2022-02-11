class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase, dependent: :destroy   purchaseモデル作ったらコメントアウト外す予定
  has_one_attached :image

  with_options presence:true do
    validates :item_name 
    validates :item_text
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :shipping_information_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
