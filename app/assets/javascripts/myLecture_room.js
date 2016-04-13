//

/* 선택된 커리큘럼의 내용을 textarea#curri_text에 뿌리기
 * @return {integer} course_id
 */
function showSelectLesson() {
  var selectedNode = $('#lesson_tree').treeview('getSelected');
  var lesson_id = selectedNode[0].id;

  $.ajax({
    url: "/get_selected_lesson/"+lesson_id,
    dataType: 'json',
    success: function(data){
      $('#curri_text').empty();
      $('#curri_text').html($.parseHTML(decodeURI(data.course.content)));
      $('#memo_save_btn').attr('disabled',false);
      $('#memo_text').empty();
      $('#memo_text').text(data.memo);
      $('#teacher_name').text(data.teacher_name);
    },
    error: function(){
      alert('강의를 찾을 수 없습니다')
    }
  });
  return lesson_id;
}

function saveMemo(lesson_id, text) {
  if (lesson_id < 1){
    alert('커리큘럼을 선택해 주세요');
  }
  else {
    $.ajax({
      url: "/lecture_room/save_memo",
      dateType: 'json',
      data: {
        lesson_id: lesson_id,
        content: text
      },
      success: function(){
        alert('저장되었습니다.');
      },
      error: function(){
        alert('Error occured!');
      }
    });
  }
}

/*
 * 레슨 뿌리기
 * @param {boolean} is_student
 */
function loadLessons(is_student) {
  $.ajax({
    url: '/lecture_room/get_lesson',
    dataType: 'json',
    data: {
      is_student: is_student
    },
    success: function(data){
      $('#lesson_tree').treeview({
        data: data
      });
    }
  });
}

function evalLesson(lesson_id, rate, comment) {
  $.ajax({
    url: '/eval_lesson/'+lesson_id.toString(),
    data: {
      rate: rate,
      comment: comment
    },
    success: function(){
      $('#end_lesson_modal').modal('hide');
      alert('저장되었습니다.');
    },
    error: function(){
      alert('Error occurred!');
    }
  });
}
