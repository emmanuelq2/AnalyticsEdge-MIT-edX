$(document).ready(function(){

$('#preloaders').append('<img src="ICPSR/css/images/purple.png" alt="" />');
$('#preloaders').append('<img src="ICPSR/css/images/blue.png" alt="" />');
$('#preloaders').append('<img src="ICPSR/css/images/aqua.png" alt="" />');
$('#preloaders').append('<img src="ICPSR/css/images/green.png" alt="" />');
$('#preloaders').append('<img src="ICPSR/css/images/orange.png" alt="" />');
$('#preloaders').append('<img src="ICPSR/css/images/red.png" alt="" />');

$('.nav_one').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/purple.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
			
			
	);
	
$('.nav_two').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/blue.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
	);
	
$('.nav_three').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/aqua.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
	);
	
$('.nav_four').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/green.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
	);
	
$('.nav_five').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/orange.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
	);
	
$('.nav_six').mouseenter(
		function () {
			$('#navBg').css('background-image','url(ICPSR/css/images/red.png)');
			$('#navBg').stop().fadeTo(200,1);	
		}).mouseleave(
		function () {
			$('#navBg').css('background-image','none');
			$('#navBg').fadeTo(0,0);
			}	
	);



//clear default input text on click and focus
$('.search').attr('value','SEARCH');
$('.search').focus(function() {
    if( $(this).attr('value') == "SEARCH" ) {
        $(this).attr('value','');
    }
});
$('.search').blur(function(){
	if( $(this).attr('value') == "" ) {
		$(this).attr('value','SEARCH');
	}
});



// apply current page highlighting
var path = window.location.pathname;
path = path.replace(/\/$/, "");
var subNavLinks = $('#sub_nav').find('a');
subNavLinks.each(function(){
	var subNavLink = $(this).attr('href');
	subNavLink = subNavLink.replace(/\/$/, "");
	if(subNavLink == path){
		console.log(subNavLink);
		$(this).addClass('current-page');
	}
});




// add hover tooltip to openicpsr search results
if($('.oi-result').length>0){
$('.oi-result a').attr('title','This data collection is available on openICPSR, a public access repository hosted by ICPSR. Clicking on this hyperlink will take you to a new browser window or tab.');

$('.oi-result').tooltip({
 	track: true,
 	tooltipClass: "oi-custom-tooltip"
 });




$('#donotshow').on('change',function(){
	
	var hide = $(this).prop('checked');
	//console.log(hide);
	if(hide == true){	
		$.cookie('hideopenicsprwarning', 'true', { expires: 100000, path: '/' });
	}
	else{
		$.removeCookie('hideopenicsprwarning',{ path: '/' });
	}
	
});
}

// handle click on openicpsr search result

$('.oi-link').on('click',function(e){
	e.preventDefault();
	var count = $(this).data('value');
	var resultid = $(this).data('resultid');
	var resurl = $(this).data('resurl');
	
	
	if($.cookie('hideopenicsprwarning') !== 'true'){
		
		$( "#dialog-confirm" ).dialog({
			dialogClass: "oi-confirm",
			resizable: false,
	  		height: 250,
	  		width: 400,
	  		modal: true,
	  		buttons: {
	    		"Ok": function() {
	    			$( this ).dialog( "close" );
	      			window.open(resurl,'_blank');
	    		},
	    		Cancel: function() {
	      			$( this ).dialog( "close" );
	    		}
	  		}
		 });
		
	}
	else {
		window.open(resurl,'_blank');
	}
	



});




// equalize aside column height
if($('aside').length != 0){
equalize();
}	
});

function equalize() {
	$('aside').css('height','');
	$('#main').css('height','');
var aside_height = $('aside').height();
var main_height = $('#main').height();
if(aside_height > main_height){
	var taller = aside_height;
	$('#main').css('height',taller);
}
else {
	var taller = main_height;
	$('aside').css('height',taller);
}
}

$(window).resize(function() {
	if($('aside').length != 0){
		equalize();
		
		}
});