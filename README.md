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

### Features
 - Users can create accounts, sign in and sign out.
 - Users can create Registered Applications which will hold the URL where events will be tracked.
 - By installing Bloc Metrics on an application or website, users can track any number of metrics which will dynamically update on the Registered Application show page using pie charts and line graphs.

### Setup and Configuration
 - Languages and Frameworks: Ruby on Rails and Bootstrap
 - Ruby version 2.4.1
 - Databases: PostgreSQL

### Development Tools and Gems include:
 - Devise
 - Faker
 - Chartkick
 - Groupdate

### To run Blocmetrics locally:
 - Clone the repository `git clone https://github.com/jordanlagan/blocmetrics.git`
 - Run `bundle install`
 - Create and migrate the database with `rails db:create` and `rails db:migrate`
 - Run the server `rails s`
 - Navigate to `localhost:3000` in your browser
