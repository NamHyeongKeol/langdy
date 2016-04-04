class IsTeacherAlwaysTrue < ActiveRecord::Migration
  def change
  	change_column :users, :is_teacher,			:boolean, default: true
  end
end
