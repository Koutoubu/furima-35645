class Order < ApplicationRecord
  belongs_to :shared

    validates :postal_number, presence: true
    validates :area_id, presence: true
    validates :municipalities, presence: true
    validates :address, presence: true
    validates :tell_number, presence: true
    validates :shared_id, presence: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area

end
