var flurry = require('sg.flurry');
var label1 = Titanium.UI.createLabel({
  color:'#999',
  text:'Click to send another set of analytics',
  font:{fontSize:20,fontFamily:'Helvetica Neue'},
  textAlign:'center',
  width:'auto'
});

label1.addEventListener('click', function(){
  flurry.onStartSession('<< YOUR API KEY HERE >>');
  flurry.logEvent('started2', {start: 'value'});
  flurry.onError('someerror2', 'no crash', 'eClass');
  flurry.setUserID('tester');
  flurry.setAge(20);
  flurry.setGender(flurry.MALE);
  flurry.onPageView();
  flurry.onEndSession();
});

Titanium.UI.currentWindow.add(label1);