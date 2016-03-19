class Users::RegistrationsController < Devise::RegistrationsController

	private
		def sign_up_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :lang_to_learn, :native_lang)
		end

		def account_update_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :lang_to_learn, :native_lang)
		end

end
