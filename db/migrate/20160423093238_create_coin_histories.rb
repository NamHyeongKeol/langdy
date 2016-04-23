class CreateCoinHistories < ActiveRecord::Migration
  def change
    create_table :coin_histories do |t|
      t.references :user, index: true, foreign_key: true

      t.boolean :is_buycoin
      t.boolean :buycoin_complete
      t.boolean :is_exchange
      t.boolean :exchange_comlete
      t.integer :amount

      t.datetime :time
      t.timestamps null: false
    end
  end
end
