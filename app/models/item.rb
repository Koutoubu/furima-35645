class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one    :shared
  belongs_to :user
  has_one_attached :image
  belongs_to :category_id, :status_id, :seller_id, :date_id

  validates :name, presence: true
  validates :explanation, presence: true
  validates :images, presence: true
  validates :category_id, :status_id, :seller_id, :area_id, :date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { in: 300..9999999 }, format:{with: /\A[0-9]+\z/ }

end
