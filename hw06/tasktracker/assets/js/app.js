// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";
import $ from "jquery";


function update_buttons() {
  $('.start-btn').each( (_, bb) => {
    let id = $(bb).data('id');
    if (id != "") {
      $(bb).text("Stop");
    }
    else {
      $(bb).text("Start");
    }
  });
}

function set_button(task_id, id) {
  $('.start-btn').each( (_, bb) => {
    if (task_id == $(bb).data('task-id')) {
      $(bb).data('id', id);
    }
  });
  update_buttons();
}

function start(task_id,time) {
  let text = JSON.stringify({
    timeblocks: {
        task_id: task_id,
        start_time: time,
        end_time: time,
        flag: true
      },
  });


  $.ajax(timeblocks_path, {
    method: "post",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => {  set_button(task_id, resp.data.id); },

  });
}

function stop(task_id, id, time) {

  let text = JSON.stringify({
    timeblocks: {
        end_time: time,
        flag: false
      },
  });

  $.ajax(timeblocks_path + "/" + id, {
    method: "put",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => {  set_button(task_id,""); },
  });
}

function start_click(ev) {

  let btn = $(ev.target);
  let task_id = btn.data('task-id');
  let id = btn.data('id');
  let utc_time = new Date();


  let time = new Date(utc_time.getTime()+(-300)*60*1000); // Attribution: https://itstillworks.com/convert-utc-date-eastern-time-5968840.html




  if (id != "") {

    stop(task_id, id, time);
  }
  else {

    start(task_id, time);
  }
}

function init_start() {

  if (!$('.start-btn')) {
    return;
  }

  $('.start-btn').click(start_click);

  update_buttons();
}

$(init_start);
