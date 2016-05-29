class CreateCoinHistories < ActiveRecord::Migration
  def change
    create_table :coin_histories do |t|
      t.references :user, index: true, foreign_key: true

      t.boolean :is_buycoin # 상품권 구매이면 true
      t.boolean :buycoin_complete # 운영진이 입금 확인하고 상품권 충전 해줬으면 true
      t.boolean :is_exchange # 상품권 환전이면 true
      t.boolean :exchange_complete # 운영진이 입금했으면 true
      t.boolean :is_transaction # 유저간 상품권 이동이라면 true
      t.boolean :transaction_complete # 선생님에게 상품권 입금이 완료됐으면 true

      t.integer :amount # 돈 액수 말고 상품권 갯수
      t.datetime :start_time # 상품권 거래 발생 시각
      # is_transaction 인 경우 학생의 돈이 빠져나간 시각 = 선생이 ajax로 승인한 시각
      # is_buycoin 이나 is_exchange 인 경우 유저가 신청한 시각
      t.datetime :end_time # 상품권 거래 완료 시각, 만약 승인되지 않으면 nil로 유지, default 값도 nil
      # is_transaction 인 경우 선생에게 상품권이 입금된 시각
      # is_buycoin 이나 is_exchange 인 경우 운영진이 완료한 시각
      t.timestamps null: false
    end
  end
end
