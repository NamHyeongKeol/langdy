class AdminController < ApplicationController
	before_action :require_admin_login

	def index
	end

	def teacher
		@teachers = User.where('is_teacher = ?', true)
		@teacher_request = TeacherInfo.where('is_approved = ?', false)
	end

	def buycoin
		@coin_histories = CoinHistory.all.order('id desc')
    @buycoin_histories = CoinHistory.where(is_buycoin: true)
	end

  def chargeCoin
    h = CoinHistory.find(params[:history_id])
    h.user.cash += h.amount
    h.user.save
    h.end_time = Time.now.to_formatted_s(:db)
    h.set_complete

    if h.save
      render plain: 'OK' and return
    end

    render plain: 'ERROR' and return
  end

  def cancelBuycoin
    h = CoinHistory.find(params[:history_id])
    h.set_complete

    if h.save
      render plain: 'OK' and return
    end

    render plain: 'ERROR' and return
  end

	def transaction
		@coin_histories = CoinHistory.all.order('id desc')
    @transaction_histories = CoinHistory.where(is_transaction: true)
	end

	def exchange
		@coin_histories = CoinHistory.all.order('id desc')
    @exchange_histories = CoinHistory.where(is_exchange: true)
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
    if amount.nil?
      redirect_to :back
    end
    amount = params[:amount].to_i
    user = User.find(params[:id].to_i)
    user.update(cash: user.cash+amount)

    # coin 거래 프로세스를 아예 바꿔야함
#    h = CoinHistory.find()
#    if amount > 0
#      h.is_buycoin = true
#      h.buycoin_complete = true
#      h.is_exchange = false
#      h.exchange_complete = false
#    elsif amount < 0
#      h.is_buycoin = false
#      h.buycoin_complete = false
#      h.is_exchange = true
#      h.exchange_complete = true
#    end
#    h.amount = amount
#    h.save

    redirect_to :back
  end

  def curriculum
    @course = Course.new
    @modifing_course = nil
    if !params[:course_id].nil?
      @modifing_course = Course.find(params[:course_id])
    end
    @courses_list = Course.all.to_a
  end

  def update
    Course.find(params[:course_id]).update(course_params)
    redirect_to :back
  end

  def hide
    Course.find(params[:course_id]).update(hide: true)
    redirect_to admin_curriculum_path
  end

  def destroy
    Course.find(params[:course_id]).update(inactive: true)
    redirect_to admin_curriculum_path
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
