class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_KANA, presence: true,format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_KANA, presence: true,format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:5},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}


  has_many :items
  has_many :shares
end
