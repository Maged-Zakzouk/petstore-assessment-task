# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
User.create(
  username: 'user1',
  password: 'user1',
  first_name: 'user',
  last_name: 'one',
  email: 'user1@gmail.com',
  phone: '0112545782154',
  user_status: 1
)

User.create(
  username: 'user2',
  password: 'user2',
  first_name: 'user',
  last_name: 'two',
  email: 'user2@gmail.com',
  phone: '0112575982275',
  user_status: 2
)

puts 'Users are created successfully'

# Create categories
Category.create(name: 'small')
Category.create(name: 'large')

puts 'Categories are created successfully'

# Create pets
Pet.create(
  name: 'Caty',
  status: 'available',
  photo_urls: %w[url1 url2 url3],
  tags: ['<cat>', '<white>'],
  category_id: 1,
  owner_id: 1
)

Pet.create(
  name: 'Jac',
  status: 'sold',
  photo_urls: %w[url1 url2 url3],
  tags: ['<dog>', '<black>'],
  category_id: 2,
  owner_id: 2
)

puts 'Pets are created successfully'
