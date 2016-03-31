class LessonController < ApplicationController

	def select_time
		@teacher = User.find(params[:id])
	end

	def book
	end
	
	# Lesson JSON용 이벤트 클래스
	class Event
		def initialize(id, student_id, start_at, end_at)
			@id = id
			@text = student_id
			@start = start_at
			@end = end_at
		end
	end
	
	def getLessons
		lessons = Lesson.where("teacher_id = #{params[:user_id]} AND start_at >= #{params[:start]} AND end_at <= #{params[:end]}").all
		
		lessons_array = []
		lessons.each do |item|
			e = Event.new(item.id, item.student_id, item.start_at, item.end_at)
			lessons_array << e
		end
		
		if !lessons_array.empty?
			render json: lessons_array.to_json
		else
			render plain: 'NO DATA'
		end
	end
end
