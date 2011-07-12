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
      $.each(data.results, function(i, tweet) {
        console.log(tweet);
 
        // Check that we got data:
        if(tweet.text !== undefined) {
          // Calculate how many hours ago was the tweet posted
          var date_tweet = new Date(tweet.created_at);
          var date_now   = new Date();
          var date_diff  = date_now - date_tweet;
          var hours      = Math.round(date_diff/(1000*60*60));
 
          // Build the html string for the current tweet
          var tweet_html = '<div class="tweet_text">';
          tweet_html    += '<a href="http://www.twitter.com/';
          tweet_html    += twitter_user + '/status/' + tweet.id + '">';
          tweet_html    += tweet.text + '<\/a><\/div>';
          tweet_html    += '<div class="tweet_hours">' + hours;
          tweet_html    += ' hours ago<\/div>';
 
          // Append html string to tweet_container div
          $('tweets').append(tweet_html);
        }
      });
    }
  );
});