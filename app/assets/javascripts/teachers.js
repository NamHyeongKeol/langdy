$(document).ready(function() {
    $(".breadcrumb").change(function() {
        gender = $("#gender").val();
        console.log(gender);
        language = $("#language").val();
        $.post('/teachers/filter_teachers',
               {gender: gender, language: language},
               function(data) {
                   $("#user_list").html(data);
               }
              );
    });

});

function passSelectTime(e) {
  // set input's value
  $('#selectTimeInput').val(e.data.start.value + ' - ' + e.data.end.value);
  $('.selectTimeInput').text(e.data.start.value + ' - ' + e.data.end.value);
}

function passSelectCourse() {
  var selectedNode = $('#tree').treeview('getSelected');
  $('#courseId').val(selectedNode[0].id); // hidden input의 data id 설정
  $('#courseSubject').val(selectedNode[0].text);
  $('.courseSubject').text(selectedNode[0].text);
}