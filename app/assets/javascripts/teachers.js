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
