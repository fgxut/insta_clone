# frozen_string_literal: true

puts 'Start inserting seed "users" ...'
5.times do
  user = User.create!(username: Faker::Name.name,
                      email: Faker::Internet.unique.email,
                      password: 'password',
                      password_confirmation: 'password')
  puts "\"#{user.username}\" has created!"
end

puts 'Start inserting seed "posts" ...'
User.limit(5).each do |user|
  post = user.posts.create(content: Faker::Hacker.say_something_smart,
                           remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random])
  puts "post#{post.id} has created!"
end
