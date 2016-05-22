//

/* 선택된 커리큘럼의 내용을 textarea#curri_text에 뿌리기
 * '혼자 공부', '강의 하기'에서 사용됨 (선택된 코스를 받아옴)
 * @return {integer} course_id
 */
function showSelectCourse() {
  var course_id = getSelectedCourse()[0].id;

  $.ajax({
    url: "/get_selected_course/"+course_id,
    dataType: 'json',
    success: function(data){
      $('#curri_text').empty();
      $('#curri_text').html($.parseHTML(decodeURI(data.course.content)));
      $('#memo_save_btn').attr('disabled',false);
      $('#memo_text').empty();
      $('#memo_text').text(data.memo);
    },
    error: function(){
      alert('강의를 찾을 수 없습니다')
    }
  });
  return course_id;
}

/* 선택된 커리큘럼의 내용을 textarea#curri_text에 뿌리기
 * '강의 듣기'에서 사용됨 (선택된 레슨을 받아옴)
 * @return {integer} course_id
 */
function showSelectLesson() {
  var course_id = getSelectedCourse()[0].id;

  $.ajax({
    url: "/get_selected_lesson/"+course_id,
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
  return course_id;
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

/**
 * 트리에서 선택된 코스를 가져옴
 * views.teachers.show에서도 같은 방식으로 가져오나 리턴이 달라 본 js에만 쓰이는 function.
 * views.teachers.show에서도 아래 함수로 쓰도록 리팩토링하는 것을 권장함
 * 
 * @return array 선택된 노드를 반환
 */
function getSelectedCourse() {
  var selectedLang = $('#tree-tab li.active a').attr("href");
  var selectedNode;
  
  // 선택된 언어에 따라서 노드를 선택하여 가져옴
  if (selectedLang == "#tree-ko") {
    selectedNode = $('#tree-ko').treeview('getSelected');
  } else if (selectedLang == "#tree-en") {
    selectedNode = $('#tree-en').treeview('getSelected');
  } else if (selectedLang == "#tree-ch") {
    selectedNode = $('#tree-ch').treeview('getSelected');
  } else {}
  
  return selectedNode;
}
