# frozen_string_literal: true

Given('all tables data are cleared') do
  UserPetBid.delete_all
  Pet.delete_all
  Category.delete_all
  User.delete_all
end
