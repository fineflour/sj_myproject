# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

list.create!(title:  "Do to Title",
             user_id:     1,
            )

10.times do |n|
   title  = Faker::Title.title
   user_id = 1
   list.create!(title:  title,
                user_id: user_id,
                activated: true,
                activated_at: Time.zone.now)
end

