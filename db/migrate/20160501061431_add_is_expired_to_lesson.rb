class AddIsExpiredToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :is_expired, :boolean, default: false
  end
end
