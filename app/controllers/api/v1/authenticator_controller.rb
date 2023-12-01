class Api::V1::AuthenticatorController < ApplicationController
	before_action :approve

	def approve
		authenticate_with_http_token || handle_bad_authentication
	end

	private
	def authenticate_with_http_token
		
	end

	def handle_bad_authentication
		render json: {message: "Bad credentials"}, status: :unauthorised
	end
end
