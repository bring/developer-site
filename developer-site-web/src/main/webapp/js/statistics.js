var statisticsUrl = (("https:" == document.location.protocol) ? "https://s.yimg.com/mi/ywa.js" : "http://d.yimg.com/mi/eu/ywa.js");

$.getScript(statisticsUrl, function() {
    var YWATracker = YWA.getTracker(YWATrackerId);
    YWATracker.setDocumentGroup('Developer');
    YWATracker.setCF(01, '');
    YWATracker.setCF(02, '');
    YWATracker.setCF(03, '');
    YWATracker.setCF(04, 'no');
    YWATracker.setCF(05, 'bring');
    YWATracker.setCF(06, 'developer');
    YWATracker.submit();
});
