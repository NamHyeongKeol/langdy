/**
 * 코스 로드 function
 * Ajax Call에 성공하면 loadCoursesCallback을 부른다.
 */
function loadCourses() {
  // 한국어 코스 로드
  $.get("/get_courses/Korean",
  {
      // lang: '<%= current_user.lang_to_learn_1 %>', // 언어는 선택 가능하도록
      mi_selectable: true, //미수강 선택가능 여부
      ye_selectable: true, //수강예정 선택가능 여부
      wa_selectable: true, //수강 완료 선택가능 여부
  },
  function(data, status, xhr) {
      loadCoursesCallback(data, "Korean");
  });
  
  // 영어 코스 로드
  $.get("/get_courses/English",
  {
      mi_selectable: true, //미수강 선택가능 여부
      ye_selectable: true, //수강예정 선택가능 여부
      wa_selectable: true, //수강 완료 선택가능 여부
  },
  function(data, status, xhr) {
      loadCoursesCallback(data, "English");
  });
  
  // 중국어 코스 로드
  $.get("/get_courses/Chinese",
  {
      mi_selectable: true, //미수강 선택가능 여부
      ye_selectable: true, //수강예정 선택가능 여부
      wa_selectable: true, //수강 완료 선택가능 여부
  },
  function(data, status, xhr) {
      loadCoursesCallback(data, "Chinese");
  });
}

/**
 * 강의 로드가 끝났을 때 호출되는 콜백
 * 해당 트리에 데이터를 설정한다.
 * @param  {Array} treeData  Ajax 콜로 얻어지는 데이터
 * @param  {String} cate     한국어, 영어, 중국어 구분
 */
function loadCoursesCallback(treeData, cate) {
    if (cate == "Korean") {
      $('#tree-ko').treeview({
        data: treeData,
        showTags: true
      });
    } else if (cate == "English") {
      $('#tree-en').treeview({
        data: treeData,
        showTags: true
      });
    } else if (cate == "Chinese") {
      $('#tree-ch').treeview({
        data: treeData,
        showTags: true
      });
    } else {}
  }