class TeachersController < ApplicationController
	before_action :require_admin_login, only: [:certify]

	def apply
		t = TeacherInfo.new
		t.user = current_user
		t.save

		redirect_to :back
	end

	def certify
		t = TeacherInfo.find(params[:id])
		t.is_approved = true
		t.save

		u = t.user
		u.is_teacher = true
		u.save

		redirect_to :back
	end
end
