// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).bind( "mobileinit", function(){
    $.mobile.page.prototype.options.degradeInputs.date = 'text';
    $.mobile.selectmenu.prototype.options.nativeMenu = false;


$(':jqmData(role="page")').live('pageshow',function(){

    alert('woiiii');
    $('#example').dataTable();
 
  });
//    $('div').live('pageshow',function(event, ui){
//  alert('This page was just hidden: ');
//  var table = $('#example').dataTable();
//  alert('woooiiii');
//  table.fnDestroy();
//});
//    $(':jqmData(id="main")').delegate(':jqmData(role="page")','pageshow', function(){
//		alert('woi');
//                $('#example').dataTable();
//                alert('wei');
//	});
    // patient listview update after submit new patient
//	$(':jqmData(id="main")').delegate(':jqmData(role="page")','pagebeforeshow', function(){
//		$('#new_patient').submit(function(event){
//		  load_patient();
//	  });
//	});

    // patient listview update after submit new prescription
//	$(':jqmData(id="main")').delegate(':jqmData(role="page")','pagebeforeshow', function(){
//		$('#new_prescription').submit(function(event){
//		  load_prescription();
//	  });
//	});

        
		
});

// show reload patient list in sidebar
function load_patient() {
    $.mobile.pageLoading();
    $.getJSON('/patients.json',function(data) {
      if($('#patient_list').length > 0) {
         $('#patient_list').empty();
         $.each(data,function(index,value) {
             var html = '<li data-theme="g" class="ui-btn ui-btn-icon-right ui-li ui-btn-up-g">'
             html += '<div class="ui-btn-inner ui-li">'
             html += '<div class="ui-btn-text">'
             html += '<a data-panel="main" href="/patients/'+value.id+'" class="ui-link-inherit">'
             html += ''+value.name+''
             html += '</div><span class="ui-icon ui-icon-arrow-r"></span></div></li>'

             $('#patient_list').append(html);

         });
      }
    })
}

// show updated patient list at prescription sidebar
function load_prescription() {
    $.mobile.pageLoading();
    $.getJSON('/prescriptions.json',function(data) {
      if($('#prescription_list').length > 0) {
         $('#prescription_list').empty();
         $.each(data,function(index,value) {
             var html = '<li data-theme="g" class="ui-btn ui-btn-icon-right ui-li ui-btn-up-g">'
             html += '<div class="ui-btn-inner ui-li">'
             html += '<div class="ui-btn-text">'
             html += '<a data-panel="main" href="/prescriptions/'+value.id+'" class="ui-link-inherit">'
             html += ''+value.name+''
             html += '</div><span class="ui-icon ui-icon-arrow-r"></span></div></li>'

             $('#prescription_list').append(html);

         });
      }
    })
}