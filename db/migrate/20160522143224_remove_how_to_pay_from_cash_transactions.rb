class RemoveHowToPayFromCashTransactions < ActiveRecord::Migration
  def change
    remove_column :cash_transactions, :how_to_pay, :string
  end
end
