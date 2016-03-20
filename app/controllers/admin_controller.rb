class AdminController < ApplicationController
	before_action :require_admin_login

	def index
		@teachers = User.where('is_teacher = ?', true)
		@teacher_request = TeacherInfo.where('is_approved = ?', false)
	end

end
