class Users::RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		:dashboard
	end

	private
		def sign_up_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :lang_to_learn, :native_lang, :profile_pic, :gender)
		end

		def account_update_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :lang_to_learn, :native_lang, :profile_pic, :gender)
		end

end
