// mySchedule.js
// this js file is writen by Ucheol
//
// This script manage teacher schedule inputs
var parse_initial_str = function(str){
  if (str == "") {return []}
  else {
    return str.split(',');
  };
};

var show_schedules = function($div, schd){
  $div.empty();
  var list = schd.get_schedule();
  for (i=0; i < list.length; i++){
    $div.append('<p class="schedule_item">'+list[i]+' &nbsp <a type="button" class="schedule_delete_btn" data-schedule="'+list[i]+'">X</a></p>');
  };
};

var check_add_btn =function(){
  if ($('input[name="start-time"]').val() != "" && $('input[name="end-time"]').val() != "") {
    $('#schedule_add_btn').attr('disabled',false);
  };
};

// Teacher schedule class
var Teacher_Schedule = function(init_str) {
  this.times = parse_initial_str(init_str);
};

// various methods
$.extend(Teacher_Schedule.prototype, {
  push_schedule: function(week_day,start,end) {
    var item = week_day+'/'+start+'~'+end
    this.times.push(item)
    console.log(item+" is pushed")
  },
  get_schedule: function() {
    return this.times
  },
  delete_schedule: function(item) {
    var what, a = arguments, L = a.length, ax;
    while (L && this.times.length) {
      what = a[--L];
      while ((ax = this.times.indexOf(what)) !== -1) {
        this.times.splice(ax, 1);
      }
    }
    console.log(item+" is removed");
  }
});
