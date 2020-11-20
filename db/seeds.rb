# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
User.destroy_all
Dog.destroy_all
Booking.destroy_all
puts "repopulating..."

#Need to assign user_id when seeding

adam = User.create(
  email: "imitalian@email.com",
  password: "123456",
  name: "Adam",
  address: "5333 casgrain Montreal Quebec"
)

dog_attributes = [
  { address: "5333 Avenue Casgrain, Montreal" },
  { address: "1145 Avenue Lajoie, Outremont" },
  { address: "7503 Quebec Highway 335, Montreal"},
  { address: "251 Av Percival, Montreal West"},
  { address: "7766 Rue George, Lachine"},
  { address: "11727 Rue Notre Dame E, Montreal"},
  { address: "1017 avenue des erables, Montreal"},
  { address: "3708 Rue Saint-Hubert, Montreal"},
  { address: "800 Rue Gagné, Lachine"},
  { address: "4430 Rue Sainte-Catherine Ouest, Westmount"}
]

dog_attributes.each do |dog|
  dog = Dog.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    address: dog[:address],
    age: rand(1..12),
    size: %w[small medium large ].sample,
    description: Faker::Creature::Dog.meme_phrase,
    user: adam
  )
end












# Bookings testing seeds (lj):

layne = User.create(
  email: "johnson@dawg.com",
  password: "123456",
  name: "Layne",
  address: "4571 rue de la Roche, Montreal, QC"
)

renter = User.create(
  email: "renter@dawg.com",
  password: "123456",
  name: "Renter Name",
  address: "4555 rue de la Roche, Montreal, QC"
)

dogless = User.create(
  email: "dogless@dawg.com",
  password: "123456",
  name: "Dogless",
  address: "4666 rue de la Roche, Montreal, QC"
)

Dog.create(
    name: "Pickles",
    breed: "Pug",
    address: "4571 rue de la Roche, Montreal, QC",
    age: rand(1..12),
    size: "small",
    description: "This little guy is the MAN.",
    user: layne
    )

Dog.create(
    name: "Moose",
    breed: "Saint Bernard",
    address: "4571 rue de la Roche, Montreal, QC",
    age: rand(1..12),
    size: "large",
    description: "My big guy.",
    user: layne
    )

Dog.create(
    name: "Geronimo",
    breed: "German Shepherd",
    address: "4571 rue de la Roche, Montreal, QC",
    age: rand(1..12),
    size: "large",
    description: "This big guy is the MAN.",
    user: layne
    )


puts "Done!"



