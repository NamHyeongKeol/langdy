class AddDefaultValueToCoinHistories < ActiveRecord::Migration
  def change
    change_column_default :coin_histories, :amount, 0
    change_column_default :coin_histories, :is_buycoin, false # 코인 구매이면 true
    change_column_default :coin_histories, :buycoin_complete, false # 운영진이 입금 확인하고 코인 충전 해줬으면 true
    change_column_default :coin_histories, :is_exchange, false # 코인 환전이면 true
    change_column_default :coin_histories, :exchange_complete, false # 운영진이 입금했으면 true
    change_column_default :coin_histories, :is_transaction, false # 유저간 코인 이동이라면 true
    change_column_default :coin_histories, :transaction_complete, false # 선생님에게 코인 입금이 완료됐으면 true
  end
end
