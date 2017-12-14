// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
function drawAboutTeamById(id) {
    // Selecting current div
    var selectedItems = document.getElementsByClassName('email-item-selected');
    var currentSelected = document.getElementById('team-item-' + id);
    if (selectedItems.length > 0) {
        for (var i = 0; i < selectedItems.length; ++i) {
            var item = selectedItems[i];
            item.classList.remove('email-item-selected');
        }
    }
    currentSelected.classList.add('email-item-selected');

    // Drawing team content
    $.ajax({
        'url' : 'main/team',
        'type' : 'GET',
        'data' : {
            'id' : id
        },
        'success' : function(data) {
            var teamContent = document.getElementById('content');
            teamContent.innerHTML = data;
        }
    });
}
