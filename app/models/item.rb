class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_information
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one :purchase, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_text
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_information_id
    validates :prefecture_id
    validates :shipping_day_id
  end
  validates :price, numericality: true
end
