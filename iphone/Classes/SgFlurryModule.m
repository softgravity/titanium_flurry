/**
 * Flurry Analytics Module v2.8.4 for iPhond/iPad. Flurry library is Copyright(c) 2011 by Flurry, Inc.
 *
 * Author: Tommy Leung
 * This module is Copyright (c) 2011 by Soft Gravity
 * and licensed under The MIT License (MIT)
 */
#import "SgFlurryModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "FlurryAnalytics.h"

@implementation SgFlurryModule

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Public APIs

//This function only needs to be called once in the app
//args[0] = apikey
-(void)startSession:(id)args
{
	ENSURE_SINGLE_ARG(args,NSString);
	[FlurryAnalytics startSession:args];
}

//Constant for the setGender function
-(id)MALE {
    return @"m";
}

//Constant for the setGender function
-(id)FEMALE {
    return @"f";
}

//For catching native uncaught exceptions
void uncaughtExceptionHandler(NSException *exception) {
    [FlurryAnalytics logError:@"Uncaught" message:@"uncaught objective-c exception" exception:exception];
    
   	NSLog(@"[INFO] SgFlurry logged %s: %@", @"Uncaught error", exception);
}

// ************** Settings ****************
//value is true or false
-(void)reportOnClose:(id)value
{
	ENSURE_SINGLE_ARG(value,NSObject);
	BOOL yn = [TiUtils boolValue:value];
	[FlurryAnalytics setSessionReportsOnCloseEnabled:yn];
}

//value is true or false
-(void)reportOnPause:(id)value
{
	ENSURE_SINGLE_ARG(value,NSObject);
	BOOL yn = [TiUtils boolValue:value];
	[FlurryAnalytics setSessionReportsOnPauseEnabled:yn];
}

//value is true or false
-(void)secureTransport:(id)value
{
	ENSURE_SINGLE_ARG(value,NSObject);
	BOOL yn = [TiUtils boolValue:value];
	[FlurryAnalytics setSecureTransportEnabled:yn];
}

//value is true or false
-(void)logUncaughtExceptions:(id)value
{
	ENSURE_SINGLE_ARG(value,NSObject);
	BOOL yn = [TiUtils boolValue:value];
    if(YES == yn){
        NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    }
}
// ************** Settings ****************



// ************** Events ****************
// args[0] = event name
// args[1] = hash of parameters
-(void)logEvent:(id)args
{
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props==nil)
	{
		[FlurryAnalytics logEvent:event];
	}
	else 
	{
		[FlurryAnalytics logEvent:event withParameters:props];
	}
    
   	NSLog(@"[INFO] SgFlurry logged %@: %@ | %@", @"Event", event, props);
}


// args[0] = event name
// args[1] = hash of parameters
-(void)logTimedEvent:(id)args
{
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props==nil)
	{
		[FlurryAnalytics logEvent:event timed:YES];
	}
	else 
	{
		[FlurryAnalytics logEvent:event withParameters:props timed:YES];
	}
    
   	NSLog(@"[INFO] SgFlurry logged %@: %@ | %@", @"Timed Event", event, props);
}

// args[0] = event name, must match the event name when it started timing
// args[1] = hash of parameters
-(void)endTimedEvent:(id)args
{
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
    
    //nil props is ok because flurry will just ignore the parameter
	[FlurryAnalytics endTimedEvent:event withParameters:props];
    
   	NSLog(@"[INFO] SgFlurry logged %@: %@ | %@", @"Timed Event End", event, props);
}

-(void)logPageView:(id)args
{
	[FlurryAnalytics logPageView];
    
   	NSLog(@"[INFO] SgFlurry logged %@", @"Page View");
}

// args[0] = error name
// args[1] = error message
-(void)logError:(id)args
{
    if ([args count] >= 2)
	{
		NSString *name = [TiUtils stringValue:[args objectAtIndex:0] ];
        NSString *message = [TiUtils stringValue:[args objectAtIndex:1] ];
        NSException *excep = [NSException exceptionWithName:@"Titanium thrown error" reason:@"" userInfo:nil];
        [FlurryAnalytics logError:name message:message exception:excep];
        
       	NSLog(@"[INFO] SgFlurry logged %@: %@ | %@", @"Error", name, message);
	}
}
// ************** Events ****************



// ************** Demographics ****************
-(void)setUserID:(id)value
{
	ENSURE_SINGLE_ARG(value,NSString);
	[FlurryAnalytics setUserID:value];
    
   	NSLog(@"[INFO] SgFlurry logged %@: %@", @"userID", value);
}

// args[0] = int
-(void)setAge:(id)value
{
	NSInteger f = [TiUtils intValue:value];
	[FlurryAnalytics setAge:f];
    
   	NSLog(@"[INFO] SgFlurry logged %@: %d", @"age", f);
}

// args[0] = string 'm'/'f' or use the constants MALE/FEMALE
-(void)setGender:(id)value
{
	ENSURE_SINGLE_ARG(value,NSString);
	[FlurryAnalytics setGender:value];
    
   	NSLog(@"[INFO] SgFlurry logged %@: %@", @"gender", value);
}

// args[0] = latitude
// args[1] = longitude
// args[2] = horizontal accuracy in meters
// args[3] = vertical accuracy in meters
-(void)setLatitude:(id)args
{   
    if ([args count] >= 4)
	{
		CGFloat lat = [TiUtils floatValue:[args objectAtIndex:0] ];
   		CGFloat lon = [TiUtils floatValue:[args objectAtIndex:1] ];
   		CGFloat horz = [TiUtils floatValue:[args objectAtIndex:2] ]; //in meters
   		CGFloat vert = [TiUtils floatValue:[args objectAtIndex:3] ]; //in meters
        [FlurryAnalytics setLatitude:lat longitude:lon horizontalAccuracy:horz verticalAccuracy:vert];
        
        NSLog(@"[INFO] SgFlurry logged %@: %f | %f | %f | %f", @"lat", lat, lon, horz, vert);
	}
}
// ************** Demographics ****************

@end
