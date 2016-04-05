class CourseController < ApplicationController
	
	def getCourses
		# 해당하는 언어의 코스를 받아옴
		# ActiveRecord 짜증나게 해서 그냥 raw SQL로 받아옴
		courses_raw_sql = "SELECT courses.id AS course_id, courses.subject, courses.rank, lessons.id AS lesson_id, lessons.start_at, lessons.end_at FROM courses LEFT OUTER JOIN lessons ON lessons.course_id = courses.id WHERE lang = #{params[:lang]} ORDER BY subject"
		#courses_raw = Course.joins('LEFT OUTER JOIN lessons ON lessons.course_id = courses.id').where("lang = #{params[:lang]}").order('subject').select('courses.id as course_id, courses.subject, courses.rank, lessons.id as lesson_id').all
		courses_raw = ActiveRecord::Base.connection.execute(courses_raw_sql)

		courses = []
		courses << Hash[ "text", "초급", "selectable", false ]
		courses << Hash[ "text", "중급", "selectable", false ]
		courses << Hash[ "text", "고급", "selectable", false ]
		
		
		courses_raw.each do |item|
			
				courses.each do |rank|
					if rank['text'] == item['rank']
						if !rank['nodes'].kind_of?(Array)
							rank['nodes'] = []
						end
						
						# 미수강, 수강 예정, 수강 완료 판별
						if item['lesson_id'].nil?
							rank['nodes'] << Hash[ "id", item['course_id'], "text", item['subject'], "tags", [ "미수강" ] ]
						else
							if item['end_at'] >= DateTime.now
								rank['nodes'] << Hash[ "id", item['course_id'], "text", item['subject'], "tags", [ "수강 예정" ], "selectable", false ]
							else
								rank['nodes'] << Hash[ "id", item['course_id'], "text", item['subject'], "tags", [ "수강 완료" ], "selectable", false ]
							end
						end
					end
				end
			
		end

		
		if !courses.empty?
			render json: courses.to_json
		else
			render plain: 'NO DATA'
		end
	end
end