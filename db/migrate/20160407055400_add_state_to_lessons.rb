class AddStateToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :state, :string
    # state 값 : 전부 소문자, 띄어쓰기는 언더바
    # 승인 대기중 : waiting_approval
    # 승인 완료 : approved
    # 승인 완료 후 취소 : canceled
    # 강의 완료시점 경과 : teacher_end
    # 선생에게 강의료 전송 : student_end
    # 추가할 것 있으면 여기다 코멘트 달고 추가해도 됨

    add_column :lessons, :is_approved, :boolean
    add_column :lessons, :is_canceled, :boolean
    add_column :lessons, :teacher_end, :boolean
    add_column :lessons, :student_end, :boolean
  end
end
