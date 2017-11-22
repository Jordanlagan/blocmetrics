# Bloc Metrics

Welcome to Bloc Metrics. This is an analytics application that you can install on your web application or website that gives you ultimate flexibility to define which metrics to track. Installation is a 1 step process, and it involves merely inserting this JavaScript code to be run somewhere during initialization. (In Rails a good place to put this code would be app/assets/javascripts/application.js)
```javascript
var blocmetrics = {};
blocmetrics.report = function(eventName){
	var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
};
```
*Note: This assumes you are running Bloc Metrics locally at http://localhost:3000 which is where rails servers run by default. See below for steps for setting up Bloc Metrics to run locally.*
