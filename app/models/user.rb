class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :first_name, :last_name, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full_width characters.'
    }
    validates :first_name_kana, :last_name_kana, format: {
      with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full_width katakana characters.'
    }
    validates :birthday
  end
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'is invalid. Input half width alphanumeric mixture characters.'
  }
end
