require 'rufus-scheduler'

class LessonController < ApplicationController

	def select_time
		@teacher = User.find(params[:id])
	end

	def book
	end

	def submitLesson
		l = Lesson.new
		l.teacher_id = params[:teacher_id]
		l.student_id = current_user.id
		l.start_at = params[:start_at]
		l.end_at = params[:end_at]
		l.is_free = params[:is_free]
		l.course_id = params[:course_id]

		l.save

		# Coin
		# Coin 사용
		t = User.find(current_user.id)
		t.cash -= params[:coin].to_i
		t.save

		scheduler = Rufus::Scheduler.new
		scheduler.in '1m' do # 시간 설정
	    # Coin 선생님에게 전달
      t = User.find(params[:teacher_id])
			t.cash += params[:coin].to_i
			t.save
		end

		render plain: 'OK'
	end

	def cancelLesson
		lesson = Lesson.find(params[:lesson_id])
		lesson.is_canceled = true

		if lesson.save
			render plain: 'OK' and return
		end
		
		render plain: 'ERROR' and return
	end

	# Lesson JSON용 이벤트 클래스
	class Event
		def initialize(id, text, start_at, end_at)
			@id = id
			@text = text
			@start = start_at
			@end = end_at
		end
	end

	def getLessons
		# 우선 선생님, 학생 모두의 레슨을 받아옴 (수정 가능성 있음)
		lessons = Lesson.where("teacher_id = #{params[:user_id]} OR student_id = #{params[:user_id]} AND start_at >= #{params[:start]} AND end_at <= #{params[:end]}").where("is_canceled != ?", true).all

		lessons_array = []
		lessons.each do |item|
			e = Event.new(item.id, item.get_event_text(current_user), item.start_at, item.end_at)
			lessons_array << e
		end

		if !lessons_array.empty?
			render json: lessons_array.to_json
		else
			render plain: 'NO DATA'
		end
	end
end
