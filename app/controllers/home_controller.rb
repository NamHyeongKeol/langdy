class HomeController < ApplicationController
	before_action :authenticate_user!, :except => [:index]

	def index
	end

	def dashboard
    @lesson_applying = Lesson.where(student: current_user)
    @lesson_applied = Lesson.where(teacher: current_user)
	end

	def feedback
		f = Feedback.new
		f.user = current_user
		f.text = params[:feedback][:text]
		f.save

		redirect_to :back
	end

  def confirm_lesson
    lesson = Lesson.find(params[:lesson_id].to_i)
    if params[:confirm] == "true"
      lesson.update(confirmed: true);
    else
      lesson.destroy
    end

    respond_to do |format|
      format.json { render json: {} }
    end
  end

  def lecture_request_complete
  end
  
  def freematching_request_complete
  end
  
end
