# frozen_string_literal: true

Then('json response is returned to the user with code {int}, type {string} and message {string}') do |code, type, message|
  body = JSON.parse(last_response.body)
  expect(body['code']).to eq code
  expect(body['type']).to eq type
  expect(body['message']).to include message
end
