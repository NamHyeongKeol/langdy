class AdminController < ApplicationController
	before_action :require_admin_login

	def index
	end

	def teacher
		@teachers = User.where('is_teacher = ?', true)
		@teacher_request = TeacherInfo.where('is_approved = ?', false)
	end

	def cash
		@transaction_requests = CashTransaction.all
	end

	def feedback
    if params[:cat].nil?
      @feedbacks = Feedback.all
    else
		  @feedbacks = Feedback.where(cat: params[:cat])
    end
	end

  def set_cash
    @users = User.all
  end

  def set_cash_proc
    amount = params[:amount].to_i
    user = User.find(params[:id].to_i)
    user.update(cash: user.cash+amount)
    redirect_to :back
  end

  def curriculum
    @course = Course.new
  end

  def create_course
    course = Course.new(course_params)
    course.save
    redirect_to :back
  end

  def lesson_history
    @lessons = Lesson.all
  end

  private

  def course_params
    params.require(:course).permit(:lang, :rank, :subject, :content)
  end

end
