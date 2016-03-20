class TeacherComment < ActiveRecord::Base
	belongs_to :commentor, :class_name => "User"
	belongs_to :commentee, :class_name => "User"
end
