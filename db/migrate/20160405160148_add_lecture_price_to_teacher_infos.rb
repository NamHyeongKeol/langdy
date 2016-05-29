class AddLecturePriceToTeacherInfos < ActiveRecord::Migration
  # 챕터당 가격을 말함
  # 한 선생은 모든 챕터에서 같은 가격
  # 0 상품권 ~ 10 상품권 중 선택, 1 상품권은 1000 원
  def change
    add_column :teacher_infos, :lecture_price, :integer
  end
end
