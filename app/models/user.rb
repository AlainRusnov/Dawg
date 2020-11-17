class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :bookings, dependent: :destroy
  has_many :dogs, dependent: :destroy


  # ADD THESE LATER
  # validates :name, presence: true, uniqueness: true
  # validates :address, presence: true, uniqueness: true
end
