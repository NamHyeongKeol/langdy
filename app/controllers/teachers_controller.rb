require 'will_paginate'
require 'will_paginate/active_record'

class TeachersController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin_login, only: [:certify]

	def apply
	end

	def submit_teacher_applicatio
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
		########################
		# 초기 선생님 찾기 시 목록
		# 1. is_teacher가 ture
		# 2. skype_id가 not null
		# 3. Order는 로그인 횟수
		########################
		@teachers = User.joins(:teacher_info).where(is_teacher: true).where("lang_to_teach_1 != ? OR lang_to_teach_2 != ? OR lang_to_teach_3 != ?", "", "", "").where("is_teacher = ? AND users.skype_id is NOT NULL", true).order(sign_in_count: :desc)

		@teachers = @teachers.paginate(page: params[:page], per_page: 5)
	end

	def filter_teachers
		# 시간 설정 되어있을 경우 available_time 테이블 JOIN, 아니면 하지 않음 (teacher_info만 JOIN)
		if !params[:day_of_week].nil? && !params[:day_of_week].empty? || !params[:time].nil? && !params[:time].empty?
			@teachers = User.joins(:available_times).joins(:teacher_info).where("is_teacher = ? AND users.skype_id is NOT NULL", true)
		else
			@teachers = User.joins(:teacher_info).where(is_teacher: true).where("is_teacher = ? AND users.skype_id is NOT NULL", true)
		end

		# 성별
		if !params[:gender].nil? && !params[:gender].empty?
			@teachers = @teachers.where(gender: params[:gender])
		end

		# 언어		
		if !params[:language].nil? && !params[:language].empty?
			@teachers = @teachers.where("lang_to_teach_1 = ? OR lang_to_teach_2 = ? OR lang_to_teach_3 = ?", params[:language], params[:language], params[:language])
		end

		# 강의 요일
		if !params[:day_of_week].nil? && !params[:day_of_week].empty?
			@teachers = @teachers.where(available_times: { week_day: params[:day_of_week] })
		end
		
		# 강의 시간
		if !params[:time].nil? && !params[:time].empty?
			time_specific_start = nil
			time_specific_end = nil
			
			if params[:time] == '0'
				time_specific_start = DateTime.new(2000, 1, 1, 0, 0, 0)
			elsif params[:time] == '1'
				time_specific_start = DateTime.new(2000, 1, 1, 6, 0, 0)
			elsif params[:time] == '2'
				time_specific_start = DateTime.new(2000, 1, 1, 12, 0, 0)
			else
				time_specific_start = DateTime.new(2000, 1, 1, 18, 0, 0)
			end
			
			time_specific_end = time_specific_start.advance(:hours => 6)
			
			@teachers = @teachers.where("available_times.start_at >= ? AND available_times.start_at < ? OR available_times.end_at >= ? AND available_times.end_at < ? OR available_times.start_at <= ? AND available_times.end_at > ?", time_specific_start, time_specific_end, time_specific_start, time_specific_end, time_specific_start, time_specific_end)
		end
		
		# 평점순
		if params[:sort_rating] == 'y'
			@teachers = @teachers.order("rating DESC")
		else # 평점순이 아닌경우는 로그인 횟수순 정렬
			@teachers = @teachers.order("sign_in_count DESC")
		end
		
		@teachers = @teachers.paginate(page: params[:page], per_page: 5)

		render :index
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
    
    # user 테이블에도 skype_id가 있음
    current_user.skype_id = teacher_application_params["skype_id"]
    current_user.save
    
    current_user.set_schedule(params[:schedules])
    redirect_to :dashboard
  end

  private

  def teacher_application_params
    params.require(:teacher_info).permit(:brief_introduction, :location, :major, :skype_id, :school_grad, :introduction, :lecture_price)
  end
end
