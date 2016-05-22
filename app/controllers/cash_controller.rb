class CashController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin_login, only: [:permit_purchase]

	def index
	end

	def submit_purchase
    h = CoinHistory.new
    h.user = current_user
    h.is_buycoin = true
    h.amount = params[:how_many]
    h.start_time = Time.now
    h.how_to_pay = params[:how_to_pay]
    h.save

    b = Buycoin.new
    # b.coin_history = h # 될까?
    # 정확히는 
    b.coin_history = CoinHistory.where(user_id: h.user_id).order('id asc').last
    # 해야 하지 않나?
    b.amount = h.amount
    b.how_to_pay = h.how_to_pay
    b.account_holder = params[:account_holder] # 예금주
    b.account_number = params[:account_number] # 계좌번호
    b.save

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
