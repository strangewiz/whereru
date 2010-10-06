//
//  WhereAreYouAppDelegate.m
//  WhereAreYou
//
//  Created by Justin Cohen on 9/29/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "WhereAreYouAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation WhereAreYouAppDelegate


@synthesize window;

@synthesize loginNavigationController, mainNavigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    locationManager = [[CLLocationManager alloc] init];
	
	[locationManager setDelegate:self];
	
	[locationManager setDistanceFilter:kCLDistanceFilterNone];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationManager startUpdatingLocation];
	
	
    NSLog(@"Registering for push notifications...");    
    [[UIApplication sharedApplication] 
	 registerForRemoteNotificationTypes:
	 (UIRemoteNotificationTypeAlert | 
	  UIRemoteNotificationTypeBadge | 
	  UIRemoteNotificationTypeSound)];
    
	
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
//    [window addSubview:loginNavigationController.view];
    [window addSubview:mainNavigationController.view];
    [window makeKeyAndVisible];
    return YES;
}

-(IBAction)showMain
{
    
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:1.0];
    //    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
    //    
    //    [loginNavigationController.view removeFromSuperview];
    //    [window addSubview:mainNavigationController.view];
    //    [UIView commitAnimations];}
    
    
    [loginNavigationController.view removeFromSuperview];
    [window addSubview:mainNavigationController.view];
    
    // set up an animation for the transition between the views
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionFromRight];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut]];
    [[window layer] addAnimation:animation forKey:@"SwitchToView1"];
}


-(IBAction)showStart
{
    
    //    [UIView beginAnimations:nil context:NULL];
    //    [UIView setAnimationDuration:1.0];
    //    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
    //    
    //    [loginNavigationController.view removeFromSuperview];
    //    [window addSubview:mainNavigationController.view];
    //    [UIView commitAnimations];}
    
    
    [loginNavigationController.view removeFromSuperview];
    [window addSubview:loginNavigationController.view];
    
    // set up an animation for the transition between the views
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:kCATransitionFromLeft];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut]];
    [[window layer] addAnimation:animation forKey:@"SwitchToView1"];
}



#pragma mark -
#pragma mark Location Management


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"Could not find location: %@", error);
}


#pragma mark -
#pragma mark Notifications 


- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken { 
	
    NSLog(@"Device Token=%@", deviceToken);
	
	/*
	 const void *devTokenBytes = [devToken bytes];
	 
	 self.registered = YES;
	 
	 [self sendProviderDeviceToken:devTokenBytes]; // custom method
	 
	 */
	
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err { 
	
    NSLog(@"Error: %@", err);    
	
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
	
    for (id key in userInfo) {
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
    }    
}



static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                       "abcdefghijklmnopqrstuvwxyz"
                       "0123456789"
                       "+/";

int encode(unsigned s_len, char *src, unsigned d_len, char *dst)
{
    unsigned triad;
    
    for (triad = 0; triad < s_len; triad += 3)
    {
        unsigned long int sr;
        unsigned byte;
        
        for (byte = 0; (byte<3)&&(triad+byte<s_len); ++byte)
        {
            sr <<= 8;
            sr |= (*(src+triad+byte) & 0xff);
        }
        
        sr <<= (6-((8*byte)%6))%6; /*shift left to next 6bit alignment*/
        
        if (d_len < 4) return 1; /* error - dest too short */
        
        *(dst+0) = *(dst+1) = *(dst+2) = *(dst+3) = '=';
        switch(byte)
        {
            case 3:
                *(dst+3) = base64[sr&0x3f];
                sr >>= 6;
            case 2:
                *(dst+2) = base64[sr&0x3f];
                sr >>= 6;
            case 1:
                *(dst+1) = base64[sr&0x3f];
                sr >>= 6;
                *(dst+0) = base64[sr&0x3f];
        }
        dst += 4; d_len -= 4;
    }
    
    return 0;
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[locationManager setDelegate:nil];
	[window release];
	[loginNavigationController release];
	[super dealloc];
}


@end
