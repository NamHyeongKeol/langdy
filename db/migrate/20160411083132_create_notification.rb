class CreateNotification < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :check
      t.integer :addressee_id
    end
  end
end
