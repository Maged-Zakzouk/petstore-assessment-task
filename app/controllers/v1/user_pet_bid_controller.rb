# frozen_string_literal: true

class V1::UserPetBidController < ApplicationController
  def create
    result = CreateUserPetBidService.new(params).execute
    errors = result.instance_variable_get(:@errors)
    if errors.blank?
      render_json_response(1, 'user bid pet', 'user bid is created on the pet')
    else
      render_json_response(0, 'user bid pet', errors)
    end
  end

  def show
    user = User.where(id: params[:id]).take
    if user.nil?
      return render_json_response(0, 'user pets bids', 'invalid user_id')
    end
  end

end
