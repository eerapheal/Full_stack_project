class Reservation < ApplicationRecord
  belongs_to :users,class_name: "User"
  belongs_to :motorcycles,class_name: "Motorcycle"
  validates :city, presence: true
  validates :users, :motorcycles, :start_date, :end_date, presence: true
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today, message: 'must be today or later' }
  validates :end_date, comparison: { greater_than: :start_date, message: 'must be after start date' }
end
