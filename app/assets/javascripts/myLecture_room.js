//

function showSelectCourse() {
  var selectedNode = $('#tree').treeview('getSelected');

  $.ajax({
    url: "/lecture_room/get_course_curri/"+selectedNode[0].id,
    dataType: 'json',
    success: function(data){
      $('#curri_text').empty();
      $('#curri_text').text(data.content);
    },
    error: function(){
      alert('error');
    }
  });
}
