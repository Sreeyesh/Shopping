class ApplicationController < ActionController::Base

	before_action :find_current_user

	private

	def find_current_user
		@current_user = User.find_by_email(cookies[:current_user])
	end
end
