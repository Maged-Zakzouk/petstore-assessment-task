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


When("user with id {string} sends get request to show all bids of all pets that user owned") do |user_id|
  headers = {
    'ACCEPT' => 'application/json'
  }
  get '/v1/user_pet_bid/' + user_id, headers: headers
end
