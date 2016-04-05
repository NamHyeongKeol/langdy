$(document).ready(function() {
    $("#submit").click(function() {
        gender = $("#gender").val();
        language = $("#language").val();
        day_of_week = $("#day_of_week").val();
        time = $("#time").val();
        $.post('/teachers/filter_teachers',
             {gender: gender, language: language, day_of_week: day_of_week, time: time},
             function(data) {
                 $("#user_list").html(data);
             }
            );

    });

});

/**
 * 강의 시간 선택 시 hidden input의 값과, 강의 신청 확정 모달에서 보여줄 텍스트를 수정한다.
 * 사실, hidden input은 필요없다.
 * @param  {Event} e    DayPilot의 Event클래스.
 * @return {None}
 */
function passSelectTime(e) {
  // set input's value
  $('#selectTimeInput').val(e.data.start.value + ' - ' + e.data.end.value);
  $('.selectTimeInput').text(e.data.start.value + ' - ' + e.data.end.value);
}

/**
 * 커리큘럼 선택 시 hidden input의 값과, 강의 신청 확정 모달에서 보여줄 텍스트를 수정한다.
 * 사실, hidden input은 필요없다.
 */
function passSelectCourse() {
  var selectedNode = $('#tree').treeview('getSelected');
  $('#courseId').val(selectedNode[0].id); // hidden input의 data id 설정
  $('#courseSubject').val(selectedNode[0].text);
  $('.courseSubject').text(selectedNode[0].text);
}

/**
 * caller: submitLesson(). 폼의 유효성 검사를 시행한다.
 * 1. 강의 시간
 * 2. 커리큘럼 
 * @return {Boolean}
 */
function submitLessonValidation() {
  if (!eventStatic) {
    $('#alert-teacher b').text('강의 시간을 선택해 주세요.');
    $('#alert-teacher').show();
    return false;
  }
  
  if (typeof $('#tree').treeview('getSelected')[0] === 'undefined') {
    $('#alert-teacher b').text('커리큘럼을 선택해 주세요.');
    $('#alert-teacher').show();
    return false;
  }
  
  return true;
}

/**
 * 강의 시작 시간, 끝나는 시간은 eventStatic 전역 변수에서 바로 받아온다.
 * 커리큘럼의 ID또한 #tree에서 선택된 노드를 바로 받아온다.
 * 
 * 레슨 DB에 추가
 * 
 * @param  {Integer}  teacher_id
 * @param  {Integer}  coin
 * @param  {Boolean}  is_free       무료 매칭일 시 = true
 * @return {Boolean}
 */
function submitLesson(teacher_id, coin, is_free = false) {
  
  // Validation
  // 들어가야 함
  if (!submitLessonValidation()) {
    $('#applyModal').modal('hide');
    $('#applyFreeModal').modal('hide');
    return 0;
  }
  
  var is_free = is_free; // 강의 신청 OR 무료 매칭 신청
  
  var teacher_id = teacher_id;
  var coin = coin;
  var start_at = eventStatic.data.start.value.replace("T", " [").concat("]");
  var end_at = eventStatic.data.end.value.replace("T", " [").concat("]");
  var course_id = $('#tree').treeview('getSelected')[0].id;
  
  $.post('/submit_lesson',
  {
    is_free: is_free,
    teacher_id: teacher_id,
    coin: coin,
    start_at: start_at,
    end_at: end_at,
    course_id: course_id
  },
  function(data, status, xhr) {
    if(data == 'OK') {
      location.replace("/dashboard");
      // 강의 신청 성공 페이지로 이동
    }
  });
}
