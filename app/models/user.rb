class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_one :teacher_info

	has_many :comments, :class_name => "TeacherComment", :foreign_key => "commentee_id"
	has_many :left_comments, :class_name => "TeacherComment", :foreign_key => "commentor_id"
end
