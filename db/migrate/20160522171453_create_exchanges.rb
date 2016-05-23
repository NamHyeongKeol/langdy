class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :coin_history, index: true, foreign_key: true
      t.integer :amount, null: false, default: 0
      t.string :how_to_pay, null: false, default: ""
      t.string :account_holder, null: false, default: "" # 예금주
      t.string :account_number, null: false, default: "" # 계좌번호

      t.timestamps null: false
    end
  end
end
