class AddDefaultValueToLessons < ActiveRecord::Migration
  def change
    # state 값 : 전부 소문자, 띄어쓰기는 언더바
    # 승인 대기중 : waiting_approval
    # 승인 완료 : approved : confirmed랑 같음
    # 승인 완료 후 취소 : canceled
    # 강의 완료시점 경과 : teacher_end
    # 선생에게 강의료 전송 : student_end
    # 추가할 것 있으면 여기다 코멘트 달고 추가해도 됨

    change_column_default :lessons, :is_approved, false
    change_column_default :lessons, :is_canceled, false
    change_column_default :lessons, :teacher_end, false
    change_column_default :lessons, :student_end, false
  end
end
