class Item < ApplicationRecord
  has_one :shared
  belongs_to :user
end
