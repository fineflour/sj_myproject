  require 'faker'
#  require '../app/models/post'
 
5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.save!
 end
 users = User.all


 # Create Topics
 15.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all


 # Create Posts
 50.times do
#    Post.create!(
    post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )

  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
#  post.update_rank

 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
     user: users.sample,
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 
  admin = User.new(
   name:     'fineflour',
   email:    'soojin.cho@bfa.org',
   password: "ConnectBfA",
   role:     'admin'
 )
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: "ConnectBfA",
   role:     'moderator'
 )
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: "ConnectBfA",
 )
 member.save!

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
