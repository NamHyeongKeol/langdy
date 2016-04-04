class AddGenderToTeacherInfos < ActiveRecord::Migration
  def change
    add_column :teacher_infos, :gender, :string
  end
end
