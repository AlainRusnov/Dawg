class Dog < ApplicationRecord
  # Has unique user_id assigned from creation but what about all the rental Users ?
  belongs_to :user
  has_many_attached :photos

  # HAS MANY USERS THROUGH BOOKINGS ??? // Dont think so but asking in case
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings, source: :user

  # pg search method
  include PgSearch::Model
  pg_search_scope :search_by_size_and_breed,
    against: [ :size, :breed ],
    using: {
      tsearch: { prefix: true }
    }

  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :age, presence: true
  validates :size, inclusion: { in: %w[small medium large]}
  validates :address, presence: true
end
