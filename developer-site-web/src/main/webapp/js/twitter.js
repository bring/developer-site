var twitter_search_url = '/twitter/search.json';
var twitter_status_url = '/twitter/status.json';


$.fn.performTwitterSearch = function (numberOfTweets, generateHtml){
	// Send JSON request to get tweets
	var selected = this;
	
	getJsonFromSearchUrl();
	
	function getJsonFromSearchUrl(){
		$.getJSON(twitter_search_url, function(data) {	
			if(data.completed_in !== undefined){
					if(data.results.length>0) {
						appendTweets(data.results, 1);					
					}
					else{
						getJsonFromStatusUrl();
					}		
			}
			else {
				getJsonFromStatusUrl();
				setTimeout(getJsonFromSearchUrl(), 2000);
			}
		});		
	}
	
	
	//Call this method if the previous search returns an empty list.
	function getJsonFromStatusUrl(){
		$.getJSON(twitter_status_url, 
			function(data) {
				if(data.length>0) {
					appendTweets(data, 2);
				}
			}
		);
	} 
	
	//Type: 1=search 2=getStatus
	function appendTweets(array, type) {
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
				selected.empty();					
				selected.append(extractElements(tweet, type));
			}
		}
	}
	
	
	function extractElements(tweet, type) {
		var image = '';
		var user = '';
		var time = relative_time(tweet.created_at);
				
		var text = tweet.text.replace(/(https?:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/, 
				function (u) {
			var shortUrl = (u.length > 30) ? u.substr(0, 30) + '...': u;
			return '<a href="' + u + '">' + shortUrl + '</a>';
		})
		.replace(/@(bringapi)/g, '<a href="http://twitter.com/$1">@$1</a>');
		
		if (type==1) {
			image = tweet.profile_image_url;
			user = formatUser(tweet.from_user);
		}
		else if (type==2){
			image = tweet.user.profile_image_url;
			user = formatUser(tweet.user.screen_name);
		}
		
		return generateHtml(image, user, text, time);
	}
	
	function formatUser(user){
		return user.replace(/(bringapi)/g, '<a href="http://twitter.com/$1">$1</a>');
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