class Users::SessionsController < Devise::SessionsController

	def after_sign_up_path_for(resource)
		:dashboard
	end

end
