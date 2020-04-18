# frozen_string_literal: true

When('user with id {string} sends post request to bid pet with id {string} with amount {string}') do |user_id, pet_id, amount|
  headers = {
    'ACCEPT' => 'application/json'
  }
  post '/v1/user_pet_bid', user_pet_bid: { user_id: user_id.blank? ? nil : user_id,
                                           pet_id: pet_id.blank? ? nil : pet_id,
                                           amount: amount.blank? ? nil : amount },
                           headers: headers
end

When('user with id {string} sends get request to show all bids of all pets that user owned') do |user_id|
  headers = {
    'ACCEPT' => 'application/json'
  }
  get '/v1/user_pet_bid/' + user_id, headers: headers
end

Given('user pet bids with the following data are Created') do |table|
  table.hashes.each do |record|
    UserPetBid.create(
      user_id: record['user_id'].to_i,
      pet_id: record['pet_id'].to_i,
      amount: record['amount'].to_d
    )
  end
end

Then('list of pets with size {int} returned to user and each pet has its bids') do |size|
  body = JSON.parse(last_response.body)
  expect(body['message'].size).to eq size
end

Then('response message has the following pets with bids with the following size') do |table|
  body = JSON.parse(last_response.body)
  pets = body['message']

  pet_flag = false
  table.hashes.each do |record|
    pets.each do |pet|
      pet_flag = true if pet['pet_name'] == record['pet_name']
    end
  end
  expect(pet_flag).to eq true
end
