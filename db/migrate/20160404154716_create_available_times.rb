class CreateAvailableTimes < ActiveRecord::Migration
  def change
    create_table :available_times do |t|
      t.integer :user_id
      t.date :date_at
      t.time :start_at
      t.time :end_at
      t.string :week_day

      t.timestamps null: false
    end
  end
end
