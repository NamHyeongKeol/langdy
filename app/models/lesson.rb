class Lesson < ActiveRecord::Base
	belongs_to :teacher, :class_name => "User"
	belongs_to :student, :class_name => "User"
	belongs_to :course, :class_name => "Course"

  def get_applying_html
    result = self.course.rank + ' | ' + self.course.subject + ' | ' + self.teacher.name + ' | ' + self.start_at.strftime('%a %b %e %T') + '~' + self.end_at.strftime('%a %b %e %T')
    if self.is_free
      result = result + " | Free Lesson"
    end
    result = result + '<span id="confirm_span' + self.id.to_s + '">'
    if self.confirmed
      result = result + " | 확정됨"
    else
      result = result + " | 미확정"
    end
    result = result + '</span>'
    return result.html_safe
  end

  def get_applied_html
    result = self.course.rank + ' | ' + self.course.subject + ' | ' + self.teacher.name + ' | ' + self.start_at.strftime('%a %b %e %T') + '~' + self.end_at.strftime('%a %b %e %T')
    if self.is_free
      result = result + "| Free Lesson"
    end
    result = result + '<span data-lesson_id="' + self.id.to_s + '" id="confirm_span' + self.id.to_s + '">'
    if self.confirmed
      result = result + " | 확정됨"
    else
      result = result + ' <button data-confirmed="true" class="confirm_btn btn btn-info">승인</button> <button data-confirmed="false" class="confirm_btn btn btn-primary">거절</button>'
    end
    result = result + '</span>'
    return result.html_safe
  end

  def get_event_text(user)
    string = ''
    if self.teacher == user
      string = string + self.student.name + ' 강의하기'
    else
      string = string + self.teacher.name + ' 강의받기'
    end
    unless self.confirmed then string = string + ' | 미확정' end
    return string
  end
end
