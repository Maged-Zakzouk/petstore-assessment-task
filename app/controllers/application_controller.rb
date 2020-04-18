# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render_successful_json_response(type, message)
    render(json: { code: 1, type: type, message: message })
  end

  def render_failure_json_response(type, message)
    render(json: { code: 0, type: type, message: message })
  end
end
