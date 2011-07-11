$(document).ready(function() {
	$("#menubox").hide();
	
	 $("#learnlauncher").click(function(event){
		 $("#menutab #launchers").children().removeClass("box");
		 $("#menutab #launchers").children().addClass("menutab");
		 $("#menutab #launchers").children().addClass("menutab-selected");
		 
		 $("#menubox").show("<p>foo</p>");
	 });
 });