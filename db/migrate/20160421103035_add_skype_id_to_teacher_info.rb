class AddSkypeIdToTeacherInfo < ActiveRecord::Migration
  def change
    add_column :teacher_infos, :skype_id, :string
    add_column :teacher_infos, :brief_introduction, :text
  end
end
