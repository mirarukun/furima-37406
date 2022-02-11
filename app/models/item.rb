class Item < ApplicationRecord
belongs_to :user
# has_one :purchase, dependent: :destroy   purchaseモデル作ったらコメントアウト外す予定
has_one_attached :image
end
