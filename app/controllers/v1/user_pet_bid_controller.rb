# frozen_string_literal: true

class V1::UserPetBidController < ApplicationController
  
  def create
    result = ValidateUserPetBid.new(request_params).validate
    errors = result.instance_variable_get(:@errors)
    return render_failure_json_response('user bid pet', errors) unless errors.blank?
    UserPetBid.create(user_id: request_params['user_id'], pet_id: request_params['pet_id'], amount: request_params['amount'])
    render_successful_json_response('user bid pet', 'user bid is created on the pet')
  end

  def request_params
    params.require(:user_pet_bid).permit(:user_id, :pet_id, :amount)
  end
end
