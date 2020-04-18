# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render_json_response(code, type, message)
    render(json: { code: code, type: type, message: message })
  end
end
