class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :description, presence: true
  validates :user, presence: true, uniqueness: { scope: :dog }
  validates :dog, presence: true
  validates :status, presence: true
end
