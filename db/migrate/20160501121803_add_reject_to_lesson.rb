class AddRejectToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :is_rejected, :boolean, default: false
  end
end
