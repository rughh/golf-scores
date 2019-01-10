class ApplicationController < ActionController::Base
  private

  def prevent_snooping
    authenticate_or_request_with_http_basic do |username, password|
      password == Rails.configuration.x.password
    end
  end
end
