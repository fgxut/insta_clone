# frozen_string_literal: true

puts 'Start inserting seed "users" ...'
5.times do
  user = User.create!(username: Faker::Name.name,
                      email: Faker::Internet.unique.email,
                      password: 'password',
                      password_confirmation: 'password')
  puts "\"#{user.username}\" has created!"
end
