class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :description, presence: true
  validates :user, presence: true
  validates :dog, presence: true
end
