class SharedAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :area_id, :municipalities, :address, :building, :tell_number, :token, :item_id, :user_id

  validates :area_id, presence: true, numericality: {other_than: 1 }
  validates :postal_number, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :tell_number, presence: true, numericality: { only_integer:true }, format: {with: /\A[0-9]{11}\z/ }
  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true

  def save
    shared = Shared.create(item_id: item_id, user_id: user_id)
    Order.create!(postal_number: postal_number, area_id: area_id, municipalities: municipalities, address: address, building: building, tell_number: tell_number, shared_id: @shared.id) 
  end
end