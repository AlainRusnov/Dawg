class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :renter_bookings, class_name: "Booking", dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :owner_bookings, through: :dogs, source: :bookings


  # ADD THESE LATER
  # validates :name,
  validates :address, presence: true
end
