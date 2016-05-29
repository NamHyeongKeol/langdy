/**
 * 코스 로드 function
 * Ajax Call에 성공하면 loadCoursesCallback을 부른다.
 * 
 * @params int type 0: 강의 신청 화면 1: 혼자 공부, 강의 듣기 2: 강의 하기
 */
function loadCourses(type) {
  
  if (type == 0) {
    mi_selectable = true; //미수강 선택가능 여부
    ye_selectable = true; //수강예정 선택가능 여부
    wa_selectable = true; //수강 완료 선택가능 여부
    is_student = 1;
  } else if (type == 1) {
    mi_selectable = false; //미수강 선택가능 여부
    ye_selectable = true; //수강예정 선택가능 여부
    wa_selectable = true; //수강 완료 선택가능 여부
    is_student = 1;
  } else if (type == 2) {
    mi_selectable = false; //미신청 선택가능 여부
    ye_selectable = true; //강의예정 선택가능 여부
    wa_selectable = true; //강의 완료 선택가능 여부
    is_student = 0;
  } else { // default
    mi_selectable = false; //미수강 선택가능 여부
    ye_selectable = true; //수강예정 선택가능 여부
    wa_selectable = true; //수강 완료 선택가능 여부
    is_student = 1;
  }
  
  // 한국어 코스 로드
  $.get("/get_courses/Korean",
  {
      // lang: '<%= current_user.lang_to_learn_1 %>', // 언어는 선택 가능하도록
      mi_selectable: mi_selectable,
      ye_selectable: ye_selectable,
      wa_selectable: wa_selectable,
      is_student: is_student
  },
  function(data, status, xhr) {
      loadCoursesCallback(data, "Korean");
  });
  
  // 영어 코스 로드
  $.get("/get_courses/English",
  {
      mi_selectable: mi_selectable,
      ye_selectable: ye_selectable, 
      wa_selectable: wa_selectable,
      is_student: is_student
  },
  function(data, status, xhr) {
      loadCoursesCallback(data, "English");
  });
  
  // 중국어 코스 로드
  $.get("/get_courses/Chinese",
  {
      mi_selectable: mi_selectable,
      ye_selectable: ye_selectable, 
      wa_selectable: wa_selectable,
      is_student: is_student
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
