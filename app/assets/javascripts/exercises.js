var exercise_ready;
exercise_ready = function(){
  $('.datepicker').datepicker({dateFormat: 'dd-mm-yy'});
};

$(document).on('turbolinks:load', exercise_ready);
