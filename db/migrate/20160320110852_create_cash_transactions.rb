class CreateCashTransactions < ActiveRecord::Migration
	def change
		create_table :cash_transactions do |t|
			t.references :sender
			t.references :receiver

			t.integer :amount

			t.boolean :is_permitted, default: false

			t.timestamps null: false
		end
	end
end
