class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :check
      t.integer :user_id
      t.integer :lesson_id
      t.integer :cash_transaction_id

      t.timestamps null: false
    end
  end
end
