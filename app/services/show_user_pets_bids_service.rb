# frozen_string_literal: true

class ShowUserPetsBidsService
  def initialize(user_id)
    @user_id = user_id
    @errors = []
    @response = []
    @user_pets = []
  end

  def execute
    check_invalid_id
    check_user_with_no_pets
    return self if !@errors.blank? || @user_pets.empty?

    get_user_pets_bids
    self
  end

  private

  def check_invalid_id
    user = User.where(id: @user_id).take
    @errors << 'invalid user_id' if user.nil?
  end

  def check_user_with_no_pets
    @user_pets = Pet.where(owner_id: @user_id)
    @response << "User hasn't any pets" if @user_pets.empty?
  end

  def get_user_pets_bids
    @user_pets.each do |user_pet|
      # current_parsed_object
      user_pet_bids = UserPetBid.where(pet_id: user_pet.id)
      bids = []
      user_pet_bids.each do |user_pet_bid|
        current_user = User.find(user_pet_bid.user_id)
        bids << { username: current_user.username, amount: user_pet_bid.amount }
      end
      @response << { pet_name: user_pet.name, bids: bids }
    end
  end
end
