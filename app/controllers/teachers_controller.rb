class TeachersController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin_login, only: [:certify]

	def apply
	end

	def submit_teacher_application
		t = TeacherInfo.new(teacher_application_params)
		t.user = current_user
		t.save

		redirect_to :dashboard
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

	def index
		@teachers = User.where('is_teacher = ?', true)
	end

	def filter_teachers
		if params[:gender] == ""
			gender = nil
		else
			gender = params[:gender]
		end

		if params[:language] == ""
			language = nil
		else
			language = params[:language]
		end

    if params[:day_of_week] == ""
      day_of_week = nil
    else
      day_of_week = params[:day_of_week]
    end

    if params[:time] == ""
      time = nil
    else
      time = params[:time]
    end

		if gender and language
			@teachers = User.where(gender: gender, native_lang: language, is_teacher: true)#.joins("LEFT JOIN available_times ON available_times.user_id = users.id AND available_times.start_at <= 12:00 ")
		elsif gender and !language
			@teachers = User.where(gender: gender, is_teacher: true)
		elsif !gender and language
			@teachers = User.where(native_lang: language, is_teacher: true)
		else
			@teachers = User.all
		end

		render layout: false
	end

	def show
    @teacher = User.find(params[:id].to_i)
		if !current_user.is_admin and !@teacher.is_teacher
			redirect_to find_teacher_path
		end
	end

	def add_comment
		c = TeacherComment.new
		c.commentee = User.find(params[:id])
		c.commentor = current_user
		c.text = params[:new_comment][:text]
		c.save

		redirect_to :back
	end

	def destroy_comment
		c = TeacherComment.find(params[:id])
		c.destroy

		redirect_to :back
	end

  def edit_teacher_info
    @teacher_info = current_user.teacher_info
  end

  def update_teacher_info
    teacher_info = current_user.teacher_info
    teacher_info.update(teacher_application_params)
    current_user.set_schedule(params[:schedules])
    redirect_to :dashboard
  end

  private

  def teacher_application_params
    params.require(:teacher_info).permit(:brief_introduction, :location, :major, :skype_id, :school_grad, :introduction, :lecture_price)
  end
end
