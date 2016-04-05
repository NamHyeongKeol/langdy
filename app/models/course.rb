class Course < ActiveRecord::Base
	has_many :lessons, :class_name => "Lesson", :foreign_key => "course_id"
end