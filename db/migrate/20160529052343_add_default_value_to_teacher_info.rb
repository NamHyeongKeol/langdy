class AddDefaultValueToTeacherInfo < ActiveRecord::Migration
  def change
    change_column_default :teacher_infos, :lecture_price, 1
  end
end
