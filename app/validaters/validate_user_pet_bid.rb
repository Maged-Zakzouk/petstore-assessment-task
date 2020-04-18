# frozen_string_literal: true

class ValidateUserPetBid 
  def initialize(user_pet_bid)
    @user_pet_bid = user_pet_bid
    @errors = []
  end

  def validate
    validate_user_pet_bid
    self
  end

  private

  def validate_user_pet_bid
    @errors << 'user_id should be provided' if @user_pet_bid['user_id'].blank?
    @errors << 'pet_id should be provided' if @user_pet_bid['pet_id'].blank?
    @errors << 'amount should be provided' if @user_pet_bid['amount'].blank?
    user = User.where(id: @user_pet_bid['user_id']).take
    @errors << 'user_id should be valid id' if user.nil?
    pet = Pet.where(id: @user_pet_bid['pet_id']).take
    @errors << 'pet_id should be valid id' if pet.nil?
    unless pet.nil?
        @errors << 'user can not bid the pet because the user is the owner of this pet' if pet.owner_id == @user_pet_bid['user_id'].to_i
    end 
    @errors << 'amount should be greater 0' if @user_pet_bid['amount'].to_i <= 0
  end
end
