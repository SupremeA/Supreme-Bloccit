require 'faker'

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

50.times do
  Post.create!(
  user:  users.sample,
  title: Faker::Lorem.sentence,
  body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

User.first.update_attributes!(
email: 'supreme036@gmail.com',
password: '12345678',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts cretaed"
puts "#{Comment.count} comments created"
