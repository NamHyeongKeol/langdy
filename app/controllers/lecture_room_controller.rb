class LectureRoomController < ApplicationController
  def index
  end

  def self_study
  end

  def take_lesson
  end

  def get_course_curri
    course = Course.find(params[:id]);
    respond_to do |format|
      format.json { render json: course }
    end
  end
end
