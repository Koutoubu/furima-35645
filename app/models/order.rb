class Order < ApplicationRecord
  validates :postal_number, presence: true
  validates :area_id, numericality: { other_than: 1 }, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :tell_number, presence: true

  belongs_to :shared
end
