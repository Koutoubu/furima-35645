class Seller_id < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い (購入者負担)' },
    { id: 3, name: '送料込み()' },
  ]

  include ActiveHash::Associations
  has_many :items

  end