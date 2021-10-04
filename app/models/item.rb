class Item < ApplicationRecord
  has_one    :shared
  belongs_to :user
  has_one_attached :image
end
