class Shared < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :orders
end
