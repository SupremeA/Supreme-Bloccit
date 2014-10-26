require 'faker'

#create users
5.times do
  user = User.new(
  name:      Faker::Name.name,
  email:     Faker::Internet.email,
  password:  Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Topics
35.times do
  Topic.create!(
  name:         Faker::Lorem.sentence,
  description:  Faker::Lorem.paragraph
  )
end
topics = Topic.all

#create posts
530.times do
  Post.create!(
  user:  users.sample,
  topic: topics.sample,
  title: Faker::Lorem.sentence,
  body:  Faker::Lorem.paragraph
  )
end

#create comments
Comment.create!(
user: users.sample,
body: Faker::Lorem.sentence
)

posts = Post.all
400.times do
  Comment.create!(
  post: posts.sample,
  body: Faker::Lorem.paragraph
  )
end



puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

# Create an admin user
admin = User.new(
name:    'Admin User',
email:   'supreme036@gmail.com',
password: '12345678',
role:     'admin'
)
admin.skip_confirmation!
admin.save!

#Create a moderator
moderator = User.new(
name:     'Moderator User',
email:    'moderator@example.com',
password: 'helloworld',
role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

#Create a member
member = User.new(
name:     'Member User',
email:    'member@example.com',
password: 'helloworld',
)

member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts cretaed"
puts "#{Comment.count} comments created"
