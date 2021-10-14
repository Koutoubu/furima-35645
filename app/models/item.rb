class Item < ApplicationRecord

  belongs_to :user
  has_one :shared
  has_one_attached :image

  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, :status_id, :seller_id, :area_id, :date_id_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
    message: 'is invalid' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :seller
  belongs_to :date_id
  belongs_to :area

end
