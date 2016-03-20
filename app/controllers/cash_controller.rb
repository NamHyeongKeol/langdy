class CashController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin_login, only: [:permit_purchase]

	def index
	end

	def submit_purchase
		t = CashTransaction.new
		t.sender = User.first #admin
		t.receiver = current_user
		t.amount = params[:transaction][:amount]
		t.save

		redirect_to :dashboard
	end

	def permit_purchase
		t = CashTransaction.find(params[:id])

		if t.is_permitted
			redirect_to :admin
		end

		t.is_permitted = true
		t.receiver.cash += t.amount
		t.receiver.save
		t.save

		redirect_to :back
	end

end
