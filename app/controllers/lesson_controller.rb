class LessonController < ApplicationController

	def select_time
		@teacher = User.find(params[:id])
	end

	def book
	end
end
