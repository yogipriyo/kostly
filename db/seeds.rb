# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# kost_list = [
#   { name: 'Kosan1', description: 'Kost bersih, indah, nyaman, aman dan tenteram1' },
#   { name: 'Kosan2', description: 'Kost bersih, indah, nyaman, aman dan tenteram2' },
#   { name: 'Kosan3', description: 'Kost bersih, indah, nyaman, aman dan tenteram3' },
#   { name: 'Kosan4', description: 'Kost bersih, indah, nyaman, aman dan tenteram4' },
#   { name: 'Kosan5', description: 'Kost bersih, indah, nyaman, aman dan tenteram5' },
#   { name: 'Kosan6', description: 'Kost bersih, indah, nyaman, aman dan tenteram6' },
#   { name: 'Kosan7', description: 'Kost bersih, indah, nyaman, aman dan tenteram7' },
#   { name: 'Kosan8', description: 'Kost bersih, indah, nyaman, aman dan tenteram8' },
#   { name: 'Kosan9', description: 'Kost bersih, indah, nyaman, aman dan tenteram9' },
#   { name: 'Kosan10', description: 'Kost bersih, indah, nyaman, aman dan tenteram10' }
# ]

# kost_list.each do |k|
#   Place.create(k)
# end


#lebih hemat resource karena hanya mengeksekusi query 1 kali, sedangkan yang diatas query akan
#diulang sebanyak jumlah array
#kost_list = [
#  {name: "Last", description: "Last"},
#  {name: "Last 2", description: "Last 2"}
#]

#Place.create(kost_list)

user = User.create!(name: 'Delta Purna W.', email: 'd@qiscus.com')
        user2 = User.create!(name: 'Ashari Juang', email: 'j@qiscus.com')

        # create 20 fake data with user and user2 everytime we run rake db:seed
        10.times do
          user.places.create!(
            name: "Kos #{Faker::Address.city}",
            description: "#{Faker::Lorem.paragraph(3)}"
          )
          user2.places.create!(
            name: "Kos #{Faker::Address.city}",
            description: "#{Faker::Lorem.paragraph(3)}"
          )
        end