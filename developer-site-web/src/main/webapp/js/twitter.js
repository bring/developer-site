$(document).ready(function() {
  // Declare variables to hold twitter API url and user name
  var twitter_timeline_url = 'http://api.twitter.com/1/statuses/user_timeline.json';
  var twitter_mention_url = 'http://search.twitter.com/search.json';
  var twitter_user    = 'bringapi';


  // Send JSON request to get user_timeline
  $.getJSON(
	twitter_timeline_url + '?count=1&callback=?&screen_name=' + twitter_user,
    function(data) {
      $.each(data, function(i, tweet) {
    	 		console.log(data);

    	// Check that we got data:
        if(tweet.text !== undefined) {
          // Calculate how many hours ago was the tweet posted
          var tweet_time = relative_time(tweet.created_at);
 
          var tweet_html = '<li class="group"><img class="avatar" src="' + 
          				tweet.user.profile_image_url + '"/><div class="avatar-list-text"><div class="question-title">' +
          				twitter_user + '</div><div class="question-text"><pre>' + 
          				tweet.text + '</pre></div>' + '<div class="datetime">' + 
          				tweet_time + '</div></div></li>';
      
          // Append strings to divs
          $('ul.avatar-list').append(tweet_html);
        }
      });
    }
  );/*
  
  // Send JSON request to get mentions
  $.getJSON(
	twitter_mention_url + '?callback=?&q=%40' + twitter_user,
    function(data) {
      var mention = data.results[0];
    	 
    	// Check that we got data:
        if(mention !== undefined) {
          // Calculate how many hours ago was the mention posted
          var mention_time = relative_time(mention.created_at);
 
          mention_html = '<li class="group"><img class="avatar" src="' + 
          				mention.profile_image_url + '"/><div class="avatar-list-text"><div class="question-title">' +
          				mention.from_user + '</div><div class="question-text"><pre>' + 
          				mention.text + '</pre></div>' + '<div class="datetime">' + 
          				mention_time + '</div></div></li>';
      
          console.log(mention_html);
          // Append strings to divs
          $('ul.avatar-list').append(mention_html);
        }
    }
  );
*/
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