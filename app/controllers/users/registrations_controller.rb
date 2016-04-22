class Users::RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		:dashboard
	end

	# Override
	def create
		super
		
		# create blank teacher
		t = TeacherInfo.new()
		t.user = current_user
		t.save
	end

	private
		def sign_up_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :lang_to_learn, :native_lang, :profile_pic, :gender)
		end

		def account_update_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :lang_to_learn, :native_lang, :lang_to_teach_1, :lang_to_teach_2, :lang_to_teach_3, :rank_to_teach_1, :rank_to_teach_2, :rank_to_teach_3, :lang_to_learn_1, :lang_to_learn_2, :lang_to_learn_3, :rank_to_learn_1, :rank_to_learn_2, :rank_to_learn_3, :profile_pic, :gender)
		end

end
