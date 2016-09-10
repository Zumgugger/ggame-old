// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(window).load(function() {

    $('#minepoints').hide();
    $('#target').show();
    $('#target_group').hide();
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat Mine gesetzt"){
            $('#minepoints').show();
            $('#target').show();
            $('#target_group').hide();
        }
    }); 
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat Posten geholt"){
            $('#minepoints').hide();
            $('#target').show();
            $('#target_group').hide();
        }
    }); 
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat Gruppe fotografiert"){
            $('#minepoints').hide();
            $('#target').hide();
            $('#target_group').show();
        }
    }); 
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat sondiert"){
            $('#minepoints').hide();
            $('#target').show();
            $('#target_group').hide();
        }
    }); 
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat spioniert"){
            $('#minepoints').hide();
            $('#target').hide();
            $('#target_group').show();
        }
    }); 
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "Spionageabwehr"){
            $('#minepoints').hide();
            $('#target').hide();
            $('#target_group').hide();
        }
    });
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat Foto bemerkt"){
            $('#minepoints').hide();
            $('#target').hide();
            $('#target_group').show();
        }
    }); 
    
    $('#action').change(function () {
        if ($('#action option:selected').text() == "hat Kopfgeld gesetzt"){
            $('#minepoints').show();
            $('#target').hide();
            $('#target_group').show();
        }
    }); 
});

