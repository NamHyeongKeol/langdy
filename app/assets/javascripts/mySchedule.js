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

// show schedules in $div, schd is a Teacher_Schedule object
var show_schedules = function($div, schd){
  $div.empty();
  var list = schd.get_schedule();
  for (i=0; i < list.length; i++){
    $div.append('<p class="schedule_item">'+list[i]+' &nbsp <a type="button" class="schedule_delete_btn" data-schedule="'+list[i]+'">X</a></p>');
  };
};

//get monday of this week
function getSunday(d) {
  d = new Date(d);
  var day = d.getDay(),
    diff = d.getDate() - day;
    return new Date(d.setDate(diff));
}

Date.prototype.addDates = function(d) {
  this.setDate(this.getDate() + d);
  return this;
}

Date.prototype.getTimeFormat = function(time) {
  return (this.getYear()+1900)+'-'+("00" + (this.getMonth()+1)).slice(-2)+'-'+("00" + this.getDate()).slice(-2)+'T'+time+':00'
}

var schedule_to_date_strings = function(str){
  var items = str.split('/');
  var week_day = items[0]
  var times = items[1].split('~');
  var sunday = getSunday(new Date());
  switch (week_day){
    case 'Monday':
      var offset = 1;
      break;
    case 'Tuesday':
      var offset = 2;
      break;
    case 'Wednesday':
      var offset = 3;
      break;
    case 'Thursday':
      var offset = 4;
      break;
    case 'Friday':
      var offset = 5;
      break;
    case 'Saturday':
      var offset = 6;
      break;
    default : //sunday
      var offset = 0;
      break;
  };
  var start_at = getSunday(new Date()).addDates(offset).getTimeFormat(times[0]);
  var end_at = getSunday(new Date()).addDates(offset).getTimeFormat(times[1]);
  return [start_at, end_at];
};

var isAvailable = function(date, schd) {
  var list = schd.get_schedule();
  var result = false;
  for (i = 0; i < list.length; i++) {
    var date_strings = schedule_to_date_strings(list[i]);
    if (date >= new DayPilot.Date(date_strings[0]) && date < new DayPilot.Date(date_strings[1])) {
      result = true;
    };
  };
  return result;
};

var show_availables_on_calendar = function(dp, schd){
  dp.onBeforeCellRender = function(args) {
    if (isAvailable(args.cell.start, schd)) {
      console.log("dd?")
      args.cell.backColor = "#9CD09C";
    };
  };
};

// check if schedule add btn is available
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
  // push new item into schedule
  push_schedule: function(week_day,start,end) {
    var item = week_day+'/'+start+'~'+end
    this.times.push(item)
    console.log(item+" is pushed")
  },
  // return schedule arrays
  get_schedule: function() {
    return this.times
  },
  // delete schedule by value
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
