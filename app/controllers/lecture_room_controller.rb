class LectureRoomController < ApplicationController
  def index
  end

  def self_study
  end

  def take_lesson
  end

  def give_lesson
  end

  def get_selected_course
    course = Course.find(params[:id].to_i)
    memo = course.memos.where(user: current_user).take
    
    render json: {course: course, memo: if memo then memo.content else '' end }
    # render json: {course: course, memo: if memo then memo.content else '' end, teacher_name: lesson.teacher.name }
  end
  
  def get_selected_lesson
    lesson = Lesson.find_by course_id: params[:id].to_i
    
    course = Course.find(params[:id].to_i)
    memo = course.memos.where(user: current_user).take
    
    render json: {course: lesson.course, memo: if memo then memo.content else '' end, teacher_name: lesson.teacher.name }
  end

  def get_lesson
    if params[:is_student] == 'true'
      lessons = current_user.lesson_to_study.where(confirmed: true, is_canceled: false)
    else
      lessons = current_user.lesson_to_teach.where(confirmed: true, is_canceled: false)
    end

    data = []
    lessons.each do |item|
      if item.teacher == current_user
        text = "#{item.student.name} | #{item.course.subject}"
      else
        text = "#{item.teacher.name} | #{item.course.subject}"
      end
      data << {id: item.id, text: text, selectable: true}
    end

    if data.empty?
      render json: 'NO DATA'
    else
      render json: data.to_json
    end
  end

  def save_memo
    lesson = Lesson.find(params[:lesson_id].to_i)
    if lesson.memos.where(user: current_user).take
      lesson.memos.where(user: current_user).take.update(content: params[:content])
    else
      Memo.create(user: current_user, lesson: lesson, content: params[:content])
    end
    render json: {}
  end

  def eval_lesson
    lesson = Lesson.find(params[:id].to_i)
    if lesson.evaluation
      lesson.evaluation.update(rate: params[:rate].to_f, comment: params[:comment])
    else
      Evaluation.create(lesson: lesson, rate: params[:rate].to_f, comment: params[:comment])
    end

    # 이미 지불된 수업은 코인을 교환하지 않음
    if lesson.state != 'paid'
      teacher = lesson.teacher
      teacher.update(cash: teacher.cash + teacher.teacher_info.lecture_price)
      lesson.update(state: 'paid')
    end
    render json: {}
  end
end
