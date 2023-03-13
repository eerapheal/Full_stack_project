class Motorcycle < ApplicationRecord

    has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :name, :price, :description, :image, :motorcycle_type, presence: true
  validates :name, :motorcycle_type, length: { maximum: 1000 }
  validates :image, :description, length: { maximum: 4500 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
