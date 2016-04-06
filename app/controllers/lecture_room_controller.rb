class LectureRoomController < ApplicationController
  def index
  end

  def self_study
  end

  def take_lesson
  end

  def get_course_curri
    course = Course.find(params[:id]);
    memo = current_user.memos.where(course: course).take
    respond_to do |format|
      format.json { render json: {course: course, memo: memo} }
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
