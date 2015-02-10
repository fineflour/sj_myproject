# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#List.create!(title:  "Do to Title}",
#             user_id:     2,
#            )

#10.times do |n|
#   title  = Faker::Name.title
#   user_id =2 
#   List.create!(title:  title,
#                user_id: user_id,
#                created_at: true,
#                updated_at: Time.zone.now)
#end
#
10.times do |n|                                                                                                                     
    name  = Faker::Name.name                                                                                                       
    list_id = n+1                                                                                                                      
     Item.create!(name: name,                                                                                                      
                  list_id: list_id,                                                                                                   
                  created_at: true,                                                                                                   
                  updated_at: Time.zone.now)
end

address_list = [
 {name: "Alabama",  abbname:   "AL"},
 {name: "Alaska",  abbname:   "AK"}

]

while !address_list.empty? do
  begin
    Address.create(address_list)
  #rescue
    #users_list = users_list.drop(1) #removing the first if the id already exist.
  end
end
