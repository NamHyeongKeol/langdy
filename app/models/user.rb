class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable
	mount_uploader :profile_pic, S3uploaderUploader

	has_one :teacher_info

	has_many :comments, :class_name => "TeacherComment", :foreign_key => "commentee_id"
	has_many :left_comments, :class_name => "TeacherComment", :foreign_key => "commentor_id"

	has_many :feedbacks

	has_many :lesson_to_teach, :class_name => "Lesson", :foreign_key => "teacher_id"
	has_many :lesson_to_study, :class_name => "Lesson", :foreign_key => "student_id"
	def lesson
		lesson_to_teach + lesson_to_study
	end
end
