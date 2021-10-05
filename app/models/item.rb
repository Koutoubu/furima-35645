class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one    :shared
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, :status_id, :seller_id, :area_id, :date_id, :images, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999 }, format:{with: /\A[0-9]+\z/ }

end
