$(document).ready(function() {
  // Declare variables to hold twitter API url and user name
  var twitter_api_url = 'http://api.twitter.com/1/statuses/user_timeline.json';
  var twitter_user    = 'bringapi';
  
  // Enable caching
  $.ajaxSetup({ cache: true });
   
  // Send JSON request
  $.getJSON(
    twitter_api_url + '?count=1&callback=?&screen_name=' + twitter_user,
    function(data) {
      $.each(data, function(i, tweet) {

    	// Check that we got data:
        if(tweet.text !== undefined) {
          // Calculate how many hours ago was the tweet posted
          var tweet_time = relative_time(tweet.created_at);
 
          // Append strings to divs
          $('.avatar').attr("src", tweet.user.profile_image_url);
          $('.question-title').append(twitter_user);
          $('.question-text').append(tweet.text);
          $('.datetime').append(tweet_time);
        }
      });
    }
  );
});

function relative_time(time_value) {
	  var values = time_value.split(" ");
	  time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
	  var parsed_date = Date.parse(time_value);
	  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
	  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
	  delta = delta + (relative_to.getTimezoneOffset() * 60);

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