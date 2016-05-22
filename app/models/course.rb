class Course < ActiveRecord::Base
	has_many :lessons, :class_name => "Lesson", :foreign_key => "course_id"
  has_many :memos

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

  # String is_student 1:학생 0:선생님
  def getTag(user, is_student)
    if is_student == "1"

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

    else # 선생님인 경우
      lesson = Lesson.where(course: self, teacher: user, confirmed: true).last
      if lesson
        if lesson.end_at >= DateTime.now
          return ["강의 예정"]
        else
          return ["강의 완료"]
        end
      else
        return ["미신청"]
      end    
      
    end
  end

  def getSelectable(tag,mi,ye,wa) # parameters mi: 미수강 | 미신청, ye: 수강 예정 | 강의 예정, wa: 수강 완료 | 강의 완료
    case tag
    when "미수강", "미신청"
      return mi == "true"
    when "수강 예정", "강의 예정"
      return ye == "true"
    else
      return wa == "true"
    end
  end
end
