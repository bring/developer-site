var twitter_search_url = '/twitter/search.json';
var twitter_status_url = '/twitter/status.json';


$.fn.performTwitterSearch = function (numberOfTweets){
	// Send JSON request to get tweets
	var selected = this;
	$.getJSON(twitter_search_url, 
		function(data) {	
			if(data.completed_in !== undefined){
				if(data.results.length>0) {
					appendTweets(data.results, numberOfTweets, 1);					
				}
				else{
					getJsonFromStatusUrl();
				}
			}
			else {
				setTimeout("$('#"+selected.attr("id")+"').performTwitterSearch("+ numberOfTweets + ")", 2000);
			}
		}
	);
	
	//Call this method if the previous search returns an empty list.
	function getJsonFromStatusUrl(){
		$.getJSON(twitter_status_url, 
			function(data) {
				if(data.length>0) {
					appendTweets(data, numberOfTweets, 2);
				}
			}
		);
	}
	
	//Type: 1=search 2=getStatus
	function appendTweets(array, numberOfTweets, type) {
		var iterations = 0;
		if(numberOfTweets > array.length){
			iterations = array.length;
		}
		else{
			iterations = numberOfTweets;
		}
		for(var i = 0; i < iterations; i++) {
			var tweet = array[i];
			
			// Check that we got data:
			if(tweet !== undefined) {
				// Append html to div
				selected.append(generateHtml(tweet, type));
			}
		}
	}
	
	function generateHtml(tweet, type) {
		if(type==1){
			return '<li class="group"><img class="avatar" src="' + 
			tweet.profile_image_url + '"/><div class="avatar-list-text"><div class="question-title">' +
			tweet.from_user + '</div><div class="question-text"><pre>' + 
			tweet.text + '</pre></div>' + '<div class="datetime">' + 
			relative_time(tweet.created_at) + '</div></div></li>';			
		}
		else if(type==2){
			return '<li class="group"><img class="avatar" src="' + 
			tweet.user.profile_image_url + '"/><div class="avatar-list-text"><div class="question-title">' +
			tweet.user.from_user + '</div><div class="question-text"><pre>' + 
			tweet.text + '</pre></div>' + '<div class="datetime">' + 
			relative_time(tweet.created_at) + '</div></div></li>';			
		}
		else{
			return '';
		}
	}
	
	function relative_time(time_value) {
		var values = time_value.split(" ");
		var delta = 0;
		if(!isNaN(values[1])){
			time_value = values[2] + " " + values[1] + ", " + values[3] + " " + values[4];
			var parsed_date = Date.parse(time_value);
			var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
			delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
			delta = delta + (relative_to.getTimezoneOffset() * 60);			
		}
		else if (!isNaN(values[2])) {
			time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
			var parsed_date = Date.parse(time_value);
			var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
			delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
			delta = delta + (relative_to.getTimezoneOffset() * 60);			
		}
		
		if (delta < 60) {
			return 'less than a minute ago';
		} else if(delta < 120) {
			return 'about a minute ago';
		} else if(delta < (60*60)) {
			return (parseInt(delta / 60)).toString() + ' minutes ago';
		} else if(delta < (120*60)) {
			return 'about an hour ago';
		} else if(delta < (24*60*60)) {
			return 'about ' + (parseInt(delta / 3600)).toString() + ' hours ago';
		} else if(delta < (48*60*60)) {
			return '1 day ago';
		} else {
			return (parseInt(delta / 86400)).toString() + ' days ago';
		}
	}
}