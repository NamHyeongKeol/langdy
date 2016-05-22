class Course < ActiveRecord::Base
	has_many :lessons, :class_name => "Lesson", :foreign_key => "course_id"

  def getIndex
    case self.rank
    when "초급"
      return 0
    when "중급"
      return 1
    else
      return 2
    end
  end

  def getTag(user)
    isStudent = self.lang == user.lang_to_learn
    if isStudent

      lesson = Lesson.where(course: self, student: user, confirmed: true).last
      if lesson

        if lesson.end_at >= DateTime.now
          return ["수강 예정"]
        else
          return ["수강 완료"]
        end

      else
        return ["미수강"]
      end

    else
      return ["강의하기"]
    end
  end

  def getSelectable(tag,mi,ye,wa) # parameters mi: 미수강, ye: 수강 예정, wa: 수강 완료
    case tag
    when "강의하기"
      return true
    when "미수강"
      return mi == "true"
    when "수강 예정"
      return ye == "true"
    else
      return wa == "true"
    end
  end

  def self.default_scope
    where inactive: false
  end
end
