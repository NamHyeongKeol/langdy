class AdminController < ApplicationController
	before_action :require_admin_login

	def index
	end

	def teacher
		@teachers = User.where('is_teacher = ?', true)
		@teacher_request = TeacherInfo.where('is_approved = ?', false)
	end

	def cash
		@transaction_requests = CashTransaction.all
	end

end
