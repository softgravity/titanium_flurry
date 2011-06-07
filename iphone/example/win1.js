var flurry = require('sg.flurry');
var label1 = Titanium.UI.createLabel({
  color:'#999',
  text:'Click to send another set of analytics',
  font:{fontSize:20,fontFamily:'Helvetica Neue'},
  textAlign:'center',
  width:'auto'
});

label1.addEventListener('click', function(){
  flurry.logEvent('started', {start: 'value2'});
  flurry.logTimedEvent('start timed', {start: 'timer'});
  setTimeout( function(){flurry.endTimedEvent('start timed', {end: 'timer'}); }, 5000 );
  flurry.logError('someerror', 'no crash??');
  flurry.logPageView();
});

Titanium.UI.currentWindow.add(label1);