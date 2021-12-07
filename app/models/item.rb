class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :which_one
  belongs_to :prefecture
  belongs_to :days
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'
    }
    validates :product_image
  end
  validates :category_id, :status_id, :which_one_id, :prefecture_id, :days_id, numericality: {
    other_than: 0, message: "can't be blank"
  }

  private

  def product_image
    self.image.attached?
  end
end
