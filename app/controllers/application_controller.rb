class ApplicationController < ActionController::Base

  # before_action :authenticate

  def authenticate
    if request.headers["Authorization"]
      begin
        auth_header = request.headers["Authorization"]
        decoded_token = JWT.decode(token, secret)
      rescue => exception
        render json: { message: "Error: #{exception}" }, status: :forbidden
      end
    else
      render json: { message: "No authorization header" }, status: :forbidden
    end
  end

  def secret
    secret = ENV["SECRET-KEY_BASE"] || Rails.application.secrets.secret_key_base
  end

  def token
    auth_header.split(" ")[1]
  end

  def create_token(payload)
    JWT.encode(payload, secret)
  end

end
