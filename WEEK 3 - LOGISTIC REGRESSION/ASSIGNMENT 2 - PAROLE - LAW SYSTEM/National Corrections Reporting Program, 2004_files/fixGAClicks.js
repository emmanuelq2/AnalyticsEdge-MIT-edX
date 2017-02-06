/*
 * This script uses jQuery to dynamically add GA tracking to download clicks on the study home page.
 * Basically, it pre-empts the href so that each click first tracks the GA even then directs the url
 * to the download.
 */

$(document).ready(function(e){

	$('a.gaClick').click(function(e){
		e.preventDefault();
		var $studyno = $(this).attr('data-studyno');
		var $level = $(this).attr('data-level');
		var $package = $(this).attr('data-package');
		var $archive = $(this).attr('data-archive');
		var $url = $(this).attr('href');
		trackClickThenFollowLink($studyno,$level,$package,$archive,$url);
	});
				
	function trackClickThenFollowLink(studyno,level,package,archive,url){
		var $onClickNormal = "/download/" + level + "/" + package;
		var $onClickSAMHDA = "/statsreport/" + studyno + "/download/" + package;
		if(archive == "SAMHDA") {
			// alert($onClickSAMHDA);
			ga('send','pageview',$onClickSAMHDA);
			 window.setTimeout( function(){
				 // alert('delayed click');
				 window.location = url;
             }, 500 );
		} else {
			// alert($onClickNormal);
			ga('send','pageview',$onClickNormal);
			 window.setTimeout( function(){
				 // alert('delayed click');
				 window.location = url;
             }, 500 );
		}
		
	};			
			
});
