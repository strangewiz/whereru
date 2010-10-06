//
//  WhereAreYouAppDelegate.h
//  WhereAreYou
//
//  Created by Justin Cohen on 9/29/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface WhereAreYouAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    UIWindow *window;
    UINavigationController *loginNavigationController;
    UINavigationController *mainNavigationController;
	CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *loginNavigationController;
@property (nonatomic, retain) IBOutlet UINavigationController *mainNavigationController;


int encode(unsigned s_len, char *src, unsigned d_len, char *dst);

-(IBAction)showMain;
-(IBAction)showStart;

@end
