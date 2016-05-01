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

    # coin 거래 프로세스 바꿔야함
#    h = CoinHistory.new
#    h.user = current_user
#    h.is_buycoin = true
#    h.buycoin_complete = false
#    h.is_exchange = false
#    h.exchange_complete = false
#    h.amount = t.amount
#    h.save

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

	def coinhistory
		@coin_histories = current_user.coin_history.to_a
	end
	
end
