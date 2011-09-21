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
flurry.setLatitude(49.660043 , 12.172852, 100, 100); //set location stats (lat, lon, horz accuracy in meters, vert accuracy in meters)
flurry.logPageView(); //logs a page view

// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');
//
var win1 = Titanium.UI.createWindow({  
    title:'Tab 1',
    backgroundColor:'#fff',
    url: 'win1.js'
});

win1.open();