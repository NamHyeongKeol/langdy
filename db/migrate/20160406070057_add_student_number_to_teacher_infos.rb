class AddStudentNumberToTeacherInfos < ActiveRecord::Migration
  def up
    change_column :teacher_infos, :rating, :float
  end

  def down
    change_column :teacher_infos, :rating, :integer
  end

  def change
    add_column :teacher_infos, :student_number, :integer
  end
end
