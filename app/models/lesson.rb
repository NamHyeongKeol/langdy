class Lesson < ActiveRecord::Base
	belongs_to :teacher, :class_name => "User"
	belongs_to :student, :class_name => "User"
	belongs_to :course, :class_name => "Course"

  has_one :evaluation

  def get_period
    result = self.start_at.strftime('%Y-%m-%d %R') + ' ~ ' + self.end_at.strftime('%R')
    return result
  end

  def get_price
    result = ""
    if self.is_free
      result = "Free Lesson"
    else
      result = self.teacher.teacher_info.lecture_price.to_s
    end
    return result
  end

  def get_confirm_student
    result = ""
    if self.confirmed
      result = I18n.t("my_page.timetable.confirmed") #확정됨
    else
      result = I18n.t("my_page.timetable.unconfirmed") #미확정
    end
    return result
  end

  def get_confirm_teacher
    result = ""
    if self.confirmed
      result = I18n.t("my_page.timetable.confirmed") #확정됨
    else
      result = result + ' <button data-confirmed="true" class="confirm_btn btn btn-info">' + I18n.t("my_page.lesson.required_accept") + '</button> <button data-confirmed="false" class="confirm_btn btn btn-primary">' + I18n.t("my_page.lesson.required_reject") + '</button>' #수락, 거절
    end
    return result
  end

  def get_applying_html
    result = self.course.rank + ' | ' + self.course.subject + ' | ' + self.teacher.name + ' | ' + self.start_at.strftime('%a %b %e %T') + '~' + self.end_at.strftime('%a %b %e %T')
    if self.is_free
      result = result + " | Free Lesson"
    else
      result = result + ' | ' + self.course.teacher.teacher_info.lecture_price
    end
    result = result + '<span id="confirm_span' + self.id.to_s + '">'
    if self.confirmed
      result = result + " | " + I18n.t("my_page.timetable.confirmed") #확정됨
    else
      result = result + " | " + I18n.t("my_page.timetable.unconfirmed") #미확정
    end
    result = result + '</span>'
    return result.html_safe
  end

  def get_applied_html
    result = self.course.rank + ' | ' + self.course.subject + ' | ' + self.teacher.name + ' | ' + self.start_at.strftime('%a %b %e %T') + ' ~ ' + self.end_at.strftime('%a %b %e %T')
    if self.is_free
      result = result + "| Free Lesson"
    else
      result = result + ' | ' + self.teacher.teacher_info.lecture_price.to_s
    end
    result = result + '<span data-lesson_id="' + self.id.to_s + '" id="confirm_span' + self.id.to_s + '">'
    if self.confirmed
      result = result + " | " + I18n.t("my_page.timetable.confirmed") #확정됨
    else
      result = result + ' <button data-confirmed="true" class="confirm_btn btn btn-info">' + I18n.t("my_page.lesson.required_accept") + '</button> <button data-confirmed="false" class="confirm_btn btn btn-primary">' + I18n.t("my_page.lesson.required_accept") + '</button>' #수락, 거절
    end
    result = result + '</span>'
    return result.html_safe
  end

  def get_event_text(user)
    string = ''
    if self.teacher == user
      string = string + self.student.name + I18n.t("my_page.timetable.give_lesson") #강의하기
    else
      string = string + self.teacher.name + I18n.t("my_page.timetable.take_lesson") #강의받기
    end
    unless self.confirmed then string = string + I18n.t("my_page.timetable.unconfirmed") end #미확정
    return string
  end
end
