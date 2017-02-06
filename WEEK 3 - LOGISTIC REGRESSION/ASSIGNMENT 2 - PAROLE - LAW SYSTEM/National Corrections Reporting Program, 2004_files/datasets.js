/*
 * This script uses jQuery to hide datasets upon load if there are more than 10 datasets. It also adds 
 * toggles to reveal 10 more datasets at a time. The initial load shows all datasets, in case the user 
 * has javascript turned off.
 * 
 * On 2014-10-21, MR modified code to display all rows instead of just displaying 10 rows at a time.
 * 
 * 
 */

$(document).ready(function(e){

	var numberOfDatasets = $('div.datasetDownload').length - 1;

	function hideRows(start){
		var $rowsToHide = $('<div>').attr('id','rowsToHide');
		var $moreLink = $('<p>').attr('id','more').html('<a href=\"#\">' + numberOfDatasets + ' datasets total. View all.</a>');
		$('div.datasetDownload:eq(' + start + ')').nextAll().andSelf().wrapAll($rowsToHide);
		$('#rowsToHide').before($moreLink);
		$('#rowsToHide').hide();
		$('#more a').click(function(e){
			e.preventDefault();
			//showRows(start);
			showAllRows();
		});
		
	};

	function showRows(end){
		$('#more').hide('slow');
		$('#more').remove();
		$('#rowsToHide').slideDown('slow');
		console.log(end);
		$('#rowsToHide').attr('id','unused');
		hideRows(Number(end + 10));
	};
	
	function showAllRows(){
		$('#more').hide('slow');
		$('#more').remove();
		$('#rowsToHide').show();
	}
	
	if(numberOfDatasets > 10){
		hideRows(10);
	};
	
});
	
	


