# frozen_string_literal: true

class CreateUserPetBidService
  def initialize(request_params)
    @request_params = request_params
    @permitted_params = permitted_params
    @errors = []
  end

  def execute
    result = ValidateUserPetBid.new(@permitted_params).validate
    @errors = result.instance_variable_get(:@errors)
    if @errors.blank?
      UserPetBid.create(user_id: @permitted_params['user_id'], pet_id: @permitted_params['pet_id'], amount: @permitted_params['amount'])
    end
    self
  end

  private

  def permitted_params
    @request_params.require(:user_pet_bid).permit(:user_id, :pet_id, :amount)
  end
end
