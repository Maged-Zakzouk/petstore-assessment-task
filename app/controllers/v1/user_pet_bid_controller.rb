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
    result = ShowUserPetsBidsService.new(params[:id]).execute
    errors = result.instance_variable_get(:@errors)
    if errors.blank?
      render_json_response(1, 'user pets bids', result.instance_variable_get(:@response))
    else
      render_json_response(0, 'user pets bids', errors)
    end
  end
end
