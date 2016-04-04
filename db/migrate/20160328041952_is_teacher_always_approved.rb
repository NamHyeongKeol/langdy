class IsTeacherAlwaysApproved < ActiveRecord::Migration
  def change
  	change_column :teacher_infos, :is_approved, 	:boolean, default: true
  end
end
