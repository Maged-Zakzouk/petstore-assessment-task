# frozen_string_literal: true

Given('users with the following data are Created') do |table|
  table.hashes.each do |record|
    User.create(
      id: record['id'],
      username: record['username'],
      password: record['password'],
      first_name: record['first_name'],
      last_name: record['last_name'],
      email: record['email'],
      phone: record['phone'],
      user_status: record['user_status']
    )
  end
end
