class AddLecturePriceToTeacherInfos < ActiveRecord::Migration
  # 한 챕터당 가격 설정, 한 선생은 모든 챕터에서 같은 가격
  def change
    add_column :teacher_infos, :lecture_price, :integer
  end
end
