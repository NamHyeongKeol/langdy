class AddDefaultValueToCashTransactions < ActiveRecord::Migration
  def change
    change_column_default :cash_transactions, :amount, 0
    change_column_default :cash_transactions, :how_to_pay, "계좌이체"
  end
end
