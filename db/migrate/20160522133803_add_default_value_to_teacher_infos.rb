class AddDefaultValueToTeacherInfos < ActiveRecord::Migration
  def change
    change_column_default :teacher_infos, :major, ""
    change_column_default :teacher_infos, :school_grad, ""
    change_column_default :teacher_infos, :introduction, nil
    change_column_default :teacher_infos, :location, ""
    change_column_default :teacher_infos, :is_approved, false
    change_column_default :teacher_infos, :gender, ""
    change_column_default :teacher_infos, :lecture_price, 0
    change_column_default :teacher_infos, :lecture_number, 0
    change_column_default :teacher_infos, :student_number, 0
    change_column_default :teacher_infos, :skype_id, ""
    change_column_default :teacher_infos, :brief_introduction, nil
  end
end
