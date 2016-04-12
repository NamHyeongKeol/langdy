class LectureRoomController < ApplicationController
  def index
  end

  def self_study
  end

  def take_lesson
  end

  def give_lesson
  end

  def get_course_curri
    course = Course.find(params[:id]);
    #lesson = current_user.get_current_lesson(course)
    #if lesson.state != 'paid' and need_pay
      #lesson.update(state: 'pending')
      #PayForLessonJob.set(wait: 1.minute).perform_later(lesson)
    #end
    respond_to do |format|
      format.json { render json: {course: course} }
    end
  end

  def save_memo
    memo = Memo.where(user: current_user, course_id: params[:course_id].to_i).take
    if memo
      memo.update(content: params[:content])
    else
      Memo.create(user:current_user, course_id: params[:course_id].to_i, content: params[:content])
    end
    respond_to do |format|
      format.json {render json: {}}
    end
  end
end
