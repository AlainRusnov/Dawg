class Dog < ApplicationRecord
  # Has unique user_id assigned from creation but what about all the rental Users ?
  belongs_to :user

  # HAS MANY USERS THROUGH BOOKINGS ??? // Dont think so but asking in case
  has_many :bookings

  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
end
