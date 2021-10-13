class Order < ApplicationRecord
  validates :postal_number, presence: true, format: { with: /\A^\d{3}-\d{4}$\z/ }
  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :tell_number, presence: true, format: { with: /\A0\d{9,10}\z/ }

  belongs_to :shared
end

