class AddDefaultValueToCashTransations < ActiveRecord::Migration
  def change
    change_column_default :cash_transactions, :amount, 0
    change_column_default :cash_transactions, :how_to_pay, "계좌이체"
    # how_to_pay는 coin_history로 옮겨감
  end
end
