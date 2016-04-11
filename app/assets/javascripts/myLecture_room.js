//

/* 선택된 커리큘럼의 내용을 textarea#curri_text에 뿌리기
 * @return {integer} course_id
 */
function showSelectCourse() {
  var selectedNode = $('#tree').treeview('getSelected');
  var course_id = selectedNode[0].id;

  $.ajax({
    url: "/lecture_room/get_course_curri/"+course_id,
    dataType: 'json',
    success: function(data){
      $('#curri_text').empty();
      $('#curri_text').html($.parseHTML(decodeURI(data.course.content)));
      $('#memo_save_btn').attr('disabled',false);
      $('#memo_text').empty();
      $('#memo_text').text(data.memo.content);
    },
    error: function(){
      alert('error');
    }
  });
  return course_id;
}

function saveMemo(user_id, course_id, text) {
  if (course_id == 0){
    alert('커리큘럼을 선택해 주세요');
  }
  else {
    $.ajax({
      url: "/lecture_room/save_memo",
      dateType: 'json',
      data: {
        user_id: user_id,
        course_id: course_id,
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
