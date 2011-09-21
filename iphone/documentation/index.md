# iphoneflurry Module

## Description

Flurry v3.0.0 for iPhone/iPad. Wrapper to the Flurry SDK for iPhone/iPad. Refer to the Flurry SDK API for more info.

## Accessing the iphoneflurry Module

To access this module from JavaScript, you would do the following:

	var iphoneflurry = require("sg.flurry");

The iphoneflurry variable is a reference to the Module object.	

## Functions

### sg.flurry.startSession(apiKey)

### sg.flurry.reportOnClose(bool)

This option is on by default. When enabled, Flurry will attempt to send session data when the app is exited as well as it normally does when the app is started. This will improve the speed at which your application analytics are updated but can prolong the app termination process due to network latency. In some cases, the network latency can cause the app to crash. 

### sg.flurry.reportOnPause(bool)

This option is off by default. When enabled, Flurry will attempt to send session data when the app is paused as well as it normally does when the app is started. This will improve the speed at which your application analytics are updated but can prolong the app pause process due to network latency. In some cases, the network latency can cause the app to crash. 

### sg.flurry.secureTransport(bool)

This option is off by default. When enabled, Flurry will send session data over SSL when the app is paused as well as it normally does when the app is started. This has the potential to prolong the app pause process due to added network latency from secure handshaking and encryption. 

### sg.flurry.logUncaughtExceptions(bool)

Logs uncaught exceptions thrown in the objective-c code

### sg.flurry.logEvent(eventId, parameters)

Paramaters is a hash and is optional

Use logEvent to count the number of times certain events happen during a session of your application. This can be useful for measuring how often users perform various actions, for example. Your application is currently limited to counting occurrences for 300 different event ids (maximum length 255 characters). Maximum of 10 event parameters per event is supported.  

### sg.flurry.logTimedEvent(eventId, parameters)

logEvent but timed.

### sg.flurry.endTimedEvent(eventId, parameters)

Use endTimedEvent to end timed event before app exists, otherwise timed events automatically end when app exists. When ending the timed event, a new event parameters object can be used to update event parameters. To keep event parameters the same, don't pass parameters. 

### sg.flurry.logPageView()

For each user interaction you want to manually log, you can use logPageView to log the page view. 

### sg.flurry.logError(errorName, errorMessage)

Use this to log exceptions and/or errors that occur in your app. Flurry will report the first 10 errors that occur in each session. 

### sg.flurry.setUserID(string)

Use this to log the user's assigned ID or username in your system. 

### sg.flurry.setAge(int)

Use this to log the user's age. Valid inputs are between 1 and 109. 

### sg.flurry.setGender(byte)

Use this to log the user's gender. Valid inputs are sg.flurry.MALE or sg.flurry.FEMALE

### sg.flurry.setLatitude(latitude, longitude, horizontalAccuracy, verticalAccuracy)

Accuracy in meters

## Constant

### sg.flurry.MALE

Used with the setGender function

### sg.flurry.FEMALE

Used with the setGender function

## Usage
Add this to your tiapp.xml

	<modules>
		<module version="1.0" platform="iphone">sg.flurry</module>
	</modules>

Sample app.js

	var flurry = require('sg.flurry');
	flurry.secureTransport(true); //use https to send request to make them more safe
	flurry.logUncaughtExceptions(true); //logs exception in objective-c code
	flurry.startSession('<< YOUR API KEY HERE >>'); //this only needs to be called once in the entire app
	flurry.logEvent('started', {start: 'value'});
	flurry.logTimedEvent('start timed', {start: 'timer'});
	setTimeout( function(){flurry.endTimedEvent('start timed', {end: 'timer'}); }, 3000 ); //end the timed event in 3 seconds
	flurry.logError('someerror', 'no crash');
	flurry.setUserID('tester4');
	flurry.setAge(10);
	flurry.setGender(flurry.MALE); //or use flurry.FEMALE
	flurry.setLatitude(49.660043 , 12.172852, 100, 100); //set location stats (lat, lan, horz accuracy in meters, vert accuracy in meters)
	flurry.logPageView(); //logs a page view

	var win1 = Titanium.UI.createWindow({  
		title:'Tab 1',
		backgroundColor:'#fff',
	});

	win1.open();

## Author

Tommy Leung

## License

The MIT License (MIT)
