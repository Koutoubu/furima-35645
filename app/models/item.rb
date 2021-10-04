class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one    :shared
  belongs_to :user
  has_one_attached :image
end
