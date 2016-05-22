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

  has_many :memos
  has_many :coin_histories
  has_many :send_cash_transactions, class_name: :CashTransaction, foreign_key: :sender_id
  has_many :receive_cash_transactions, class_name: :CashTransaction, foreign_key: :receiver_id

  validate :rank_should_not_be_nil

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

  # return current course lesson
  def get_current_lesson(course)
    return self.lesson_to_study.where(course: course, confirmed: true).min { |a, b| (a.end_at - Time.now).abs <=> (b.end_at - Time.now).abs }
  end

  def self.default_scope
    where inactive: false
  end

  def update_without_password(params, *options)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  private 

  	# 언어 고르면 랭크도 골라야만 통과
    def rank_should_not_be_nil
      if (lang_to_teach_1 != '') and (rank_to_teach_1.nil? or rank_to_teach_1 == '')
        errors.add('가르칠 수 있는 언어 1', '의 수준을 골라주세요.')
      elsif (lang_to_teach_2 != '') and (rank_to_teach_2.nil? or rank_to_teach_2 == '')
        errors.add('가르칠 수 있는 언어 2', '의 수준을 골라주세요.')
      elsif (lang_to_teach_3 != '') and (rank_to_teach_3.nil? or rank_to_teach_3 == '')
        errors.add('가르칠 수 있는 언어 3', '의 수준을 골라주세요.')
      elsif (lang_to_learn_1 != '') and (rank_to_learn_1.nil? or rank_to_learn_1 == '')
        errors.add('배우고 싶은 언어 1', '의 수준을 골라주세요.')
      elsif (lang_to_learn_2 != '') and (rank_to_learn_2.nil? or rank_to_learn_2 == '')
        errors.add('배우고 싶은 언어 2', '의 수준을 골라주세요.')
      elsif (lang_to_learn_3 != '') and (rank_to_learn_3.nil? or rank_to_learn_3 == '')
        errors.add('배우고 싶은 언어 3', '의 수준을 골라주세요.')
	    end
    end
end
