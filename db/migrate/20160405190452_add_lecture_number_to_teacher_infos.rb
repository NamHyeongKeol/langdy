class AddLectureNumberToTeacherInfos < ActiveRecord::Migration
  def change
    add_column :teacher_infos, :lecture_number, :integer
    add_column :teacher_infos, :rating, :integer
  end
end
