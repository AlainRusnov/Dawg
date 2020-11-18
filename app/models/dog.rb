class Dog < ApplicationRecord
  # Has unique user_id assigned from creation but what about all the rental Users ?
  belongs_to :user
  has_many_attached :photos

  # HAS MANY USERS THROUGH BOOKINGS ??? // Dont think so but asking in case
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings, source: :user
  validates :address, presence: true
  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
<<<<<<< HEAD
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
=======
  validates :age, presence: true
  validates :size, inclusion: { in: %w[small medium large]}
>>>>>>> cf75d6042e548ea107112aee0b4026420b196a6c
end
