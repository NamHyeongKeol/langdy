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

  has_many :available_times
	def lesson
		lesson_to_teach + lesson_to_study
	end

  # set user's available time from input
  def set_schedule(str)
    self.available_times.map{|item| item.destroy}
    list = str.split(',')
    list.each do |item|
      components = item.split('/')
      times = components[1].split('~')
      AvailableTime.create(user: self, week_day: components[0], start_at: times[0], end_at: times[1])
    end
  end

  # return schedule information for js
  def get_schedule
    raw_list = self.available_times.pluck(:week_day, :start_at, :end_at)
    return raw_list.map{|item| item[0]+'/'+item[1].strftime('%H:%M')+'~'+item[2].strftime('%H:%M')}.join(',')
  end
end
