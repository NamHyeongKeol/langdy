class HomeController < ApplicationController
	before_action :authenticate_user!, :except => [:index]

	def index
	end

	def dashboard
	end

	def feedback
		f = Feedback.new
		f.user = current_user
		f.text = params[:feedback][:text]
		f.save

		redirect_to :back
	end

end
