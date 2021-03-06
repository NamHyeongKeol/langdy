class CreateCashTransactions < ActiveRecord::Migration
	def change
		create_table :cash_transactions do |t|
      # cash transaction은 수강시 학생에서 선생에게 넘어가는 수강권 흐름의 데이터다

      t.references :sender
			t.references :receiver
      t.references :coin_history, index: true, foreign_key: true
      # cash_transaction 은 coin_history 의 세 가지 종류 중 하나다.

			t.integer :amount # 선생이 명시한 강의료
      t.string :how_to_pay # 현재 계좌이체, 알리페이 두 종류중 하나
      # how_to_pay는 coin_history로 옮겨감

			t.boolean :is_permitted, default: false
      # 학생이 강의평가 완료하거나 6 시간 지났으면 true

			t.timestamps null: false
		end
	end
end
