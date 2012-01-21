/* 
 * App by Jeroen Ooms for the 'Nabel' function by Thomas Zumbrunn.
 * www.opencpu.org
 * Released under AGPL according to OpenCPU conditions.
 */

$(function() {

	var hashkey;

	// this function pulls the plot that we created and displays a PNG image. 
	var renderPlot = function(){
		var width = $("#plotdiv").width() - 5;
		var height = $("#plotdiv").height() - 20;
		if(hashkey){
			$("#plotimg").attr("src","spinner.gif");
			setTimeout(function(){ 
				$("#plotimg").attr("src", "/R/store" + hashkey + "/png?!width=" + width + "&!height=" + height);
			}, 10);
		}
	}
	
	//this function does the same for PDF.
	var getpdf = function(){
		if(hashkey){
			window.open("/R/store" + hashkey + "/pdf");
		}
		return false;
	}
	
	// this function calls the 'nabel' function from the 'opencpu.demo' package
	var callPlot = function(){
		var pollutant = $("#pollutant").val();
		var stations = $(".station:checked").map(function () {return parseInt(this.id);}).get();
		var interval = $("#interval").val();
		var period = $("#period").val();
		
		
		
		if(stations.length == 0){
			alert("You need to select at least one station.");
			return false;
		}
		
	
		$("#plotimg").attr("src", "spinner.gif");
		$.ajax({
			url: "/R/call/opencpu.demo/nabel/save",
			dataType: "json",
			timeout: 60*1000,
			data: {
				pollutant : JSON.stringify(pollutant),
				stations : JSON.stringify(stations),
				interval : JSON.stringify(interval),
				period : JSON.stringify(period)				
			}, 
			success: function(data){
				hashkey = data.graphs[0];
				renderPlot();
			},
			error: function(xhr, textStatus, errorThrown) {
				alert( "Request failed: " + xhr.responseText);
			}
		});
		
		return false;
	}
	
	$( "#plotdiv" ).resizable({
		minWidth: 320,
		maxWidth: 1800,
		minHeight: 240,
		maxHeight: 800
	}).bind( "resizestart", function() {
		$("#plotimg").hide();
	}).bind( "resizestop", function(event, ui) {
		renderPlot();
		$("#plotimg").show();		
	});
	
	            
	
	
	$("#plotbutton").button({icons: {primary: "ui-icon-image"}}).click(callPlot);
	$("#pdfbutton").button({icons: {primary: "ui-icon-document"}}).click(getpdf);
	$("select").selectmenu();
	$(document).ready(callPlot);
	
});

