class Lesson < ActiveRecord::Base
	belongs_to :teacher, :class_name => "User"
	belongs_to :student, :class_name => "User"
	belongs_to :course, :class_name => "Course"
end
