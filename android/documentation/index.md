# androidflurry Module

## Description

Flurry v3.0.5 for android. Wrapper to the Flurry SDK for android. Refer to the Flurry SDK API for more info.

## Accessing the androidflurry Module

To access this module from JavaScript, you would do the following:

	var androidflurry = require("sg.flurry");

The androidflurry variable is a reference to the Module object.	

## Functions

### sg.flurry.onStartSession(apiKey)

### sg.flurry.onEndSession()

Must be called for each onStartSession

### sg.flurry.setContinueSessionMillis(milliseconds)

### sg.flurry.logEvent(eventId, parameters)

Paramaters is a hash and is optional

Use logEvent to track user events that happen during a session. You can track how many times each event occurs, what order events happen in, as well as what the most common parameters are for each event.

This can be useful for measuring how often users take various actions, or what sequences of actions they usually perform.

Each application supports a maximum of 100 events, and each event id, parameter key, and parameter value must be no more than 255 characters in length. Each event can have no more than 10 parameters. The parameter argument is optional, and may be null. 

### sg.flurry.onError(errorId, message, errorClass)

Use onError to report application errors. Flurry will report the first 10 errors to occur in each session.

### sg.flurry.onPageView()

Use onPageView to report page view count. You should call this method whenever a new page is shown to the user to increment the total count. Page view is tracked separately from events. 

### sg.flurry.setUserID(string)

Use this to log the user's assigned ID or username in your system. 

### sg.flurry.setAge(int)

Use this to log the user's age. Valid inputs are between 1 and 109. 

### sg.flurry.setGender(byte)

Use this to log the user's gender. Valid inputs are sg.flurry.MALE or sg.flurry.FEMALE

### sg.flurry.setReportLocation(bool)

To disable/enable detailed location reporting even when your app has permission. Enabled by default.

## Constant

### sg.flurry.MALE

Used with the setGender function

### sg.flurry.FEMALE

Used with the setGender function

## Usage

Add this to your tiapp.xml

	<modules>
		<module version="1.2" platform="android">sg.flurry</module>
	</modules>

Sample app.js

	var flurry = require('sg.flurry');
	flurry.onStartSession('<< YOUR API KEY HERE >>');
	flurry.logEvent('started', {start: 'value'});
	flurry.onError('someerror', 'no crash', 'eClass');
	flurry.setUserId('tester');
	flurry.setAge(10);
	flurry.setGender(flurry.MALE); //or use flurry.FEMALE
	flurry.onPageView();
	flurry.onEndSession(); //make sure you call this or the events won't be set

	var win1 = Titanium.UI.createWindow({  
		title:'Tab 1',
		backgroundColor:'#fff'
	});

	win1.open();

## Author

Tommy Leung

## License

The MIT License (MIT)