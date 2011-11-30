/**
 * Flurry Analytics Module v2.1 for Android. Flurry library is Copyright(c) 2011 by Flurry, Inc.
 *
 * Author: Tommy Leung
 * This module is Copyright (c) 2011 by Soft Gravity
 * and licensed under The MIT License (MIT)
 */
package sg.flurry;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;

import org.appcelerator.titanium.TiContext;
import org.appcelerator.titanium.util.Log;
//import org.appcelerator.titanium.util.TiConfig;

import com.flurry.android.*;

//This module is used to wrap the native flurry agent for use in appcelerator
@Kroll.module(name="Androidflurry", id="sg.flurry")
public class AndroidflurryModule extends KrollModule
{

	// Standard Debugging variables
	private static final String LCAT = "AndroidflurryModule";
	//private static final boolean DBG = TiConfig.LOGD;
    
	@Kroll.constant public static final byte MALE = Constants.MALE;
  	@Kroll.constant public static final byte FEMALE = Constants.FEMALE;
    
	public AndroidflurryModule(TiContext tiContext) {
		super(tiContext);
	}

	// ********* Sessions *************
    // apiKey is the unique key when for the application on flurry
    @Kroll.method
    public void onStartSession(String apiKey){
        FlurryAgent.onStartSession(this.context.getAndroidContext() , apiKey);
		Log.d(LCAT, "start context: " + this.context.getAndroidContext());
    }
    
    //Must be called if you want events to be sent
  	@Kroll.method
    public void onEndSession(){      
        FlurryAgent.onEndSession(this.context.getAndroidContext());
   		Log.d(LCAT, "end context: " + this.context.getAndroidContext());
    }
	// ********* Sessions *************
    
    
    
    // ********* Settings *************
    
  	@Kroll.method
    public void setContinueSessionMillis(long milliseconds){      
        FlurryAgent.setContinueSessionMillis(milliseconds);
   		Log.d(LCAT, "set continue session timeout: " + milliseconds);
    }

  	@Kroll.method
    public void setReportLocation(boolean track){      
        FlurryAgent.setReportLocation(track);
   		Log.d(LCAT, "track location: " + track);
    }

  	@Kroll.method
    public void setUseHttps(boolean useHttps){
  		FlurryAgent.setUseHttps(useHttps);
   		Log.d(LCAT, "setUseHttps: " + useHttps);
    }
    // ********* Settings *************
    
    
    
 	// ********* Events *************
  	@Kroll.method
    public void onEvent(String eventId, @Kroll.argument(optional=true) KrollDict parameters){      
        FlurryAgent.onEvent(eventId, parameters);
		Log.d(LCAT, "logged event: " + eventId + " " + parameters);
    }
    
  	@Kroll.method
    public void onPageView(){      
        FlurryAgent.onPageView();
        Log.d(LCAT, "logged page view");
    }
    
  	@Kroll.method
    public void onError(String errorId, String message, String errorClass){      
        FlurryAgent.onError(errorId, message, errorClass);
        Log.d(LCAT, "logged error: " + errorId + " | " + message + " | " + errorClass);
    }
 	// ********* Events *************
    
    
    
  	// ********* Demographics *************
    
    @Kroll.method
    public void setUserID(String userId){      
        FlurryAgent.setUserId(userId);
        Log.d(LCAT, "set userid: " + userId);
    }
    
    @Kroll.method
    public void setAge(int age){      
        FlurryAgent.setAge(age);
        Log.d(LCAT, "set age: " + age);
    }
    
    //Use the constants AndroidflurryModule.MALE or AndroidflurryModule.FEMALE in your javascript files
    @Kroll.method
    public void setGender(byte gender){
        FlurryAgent.setGender(gender);
        Log.d(LCAT, "logged gender: " + gender);
    }
    // ********* Demographics *************
}
