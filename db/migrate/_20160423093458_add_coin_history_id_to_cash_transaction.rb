class AddCoinHistoryIdToCashTransaction < ActiveRecord::Migration
  def change
    add_reference :cash_transactions, :coin_history_id, index: true, foreign_key: true
  end
end
