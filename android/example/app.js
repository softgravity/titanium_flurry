var flurry = require('sg.flurry');
flurry.onStartSession('<< YOUR API KEY HERE >>');
flurry.logEvent('started', {start: 'value'});
flurry.onError('someerror', 'no crash', 'eClass');
flurry.setUserID('tester');
flurry.setAge(10);
flurry.setGender(flurry.MALE); //or use flurry.FEMALE
flurry.onPageView();
flurry.onEndSession(); //make sure you call this or the events won't be set

// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');
//
var win1 = Titanium.UI.createWindow({  
    title:'Tab 1',
    backgroundColor:'#fff',
    url: 'win1.js'
});

win1.open();