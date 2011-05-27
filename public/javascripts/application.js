// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).bind( "mobileinit", function(){
    $.mobile.page.prototype.options.degradeInputs.date = 'text';
    $.mobile.selectmenu.prototype.options.nativeMenu = false;


    $('div:jqmData(role="page")').live('pagebeforeshow',function(){
        $(this).find('.example').dataTable();
    });

    $('div:jqmData(id="menu")').delegate('div:jqmData(role="page")', 'pagebeforeshow', function(){
        $(this).find('.logout-btn').addClass('ui-splitview-hidden')
    });

    $('div:jqmData(id="main")').delegate('div:jqmData(role="page")', 'pagebeforeshow', function(){
       $(this).find('div[data-role="navbar"]:not(".page-specific")').addClass('ui-splitview-hidden');
    });
// patient listview update after submit new patient
//	$(':jqmData(id="main")').delegate(':jqmData(role="page")','pagebeforeshow', function(){
//		$('#new_patient').submit(function(event){
//		  load_patient();
//	  });
//	});

});

// show updated patient list at prescription sidebar
// function load_prescription() {
//     $.mobile.pageLoading();
//     $.getJSON('/prescriptions.json',function(data) {
//       if($('#prescription_list').length > 0) {
//          $('#prescription_list').empty();
//          $.each(data,function(index,value) {
//              var html = '<li data-theme="g" class="ui-btn ui-btn-icon-right ui-li ui-btn-up-g">'
//              html += '<div class="ui-btn-inner ui-li">'
//              html += '<div class="ui-btn-text">'
//              html += '<a data-panel="main" href="/prescriptions/'+value.id+'" class="ui-link-inherit">'
//              html += ''+value.name+''
//              html += '</div><span class="ui-icon ui-icon-arrow-r"></span></div></li>'

//              $('#prescription_list').append(html);

//          });
//       }
//     })
// }