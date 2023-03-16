class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations, dependent: :destroy
end
