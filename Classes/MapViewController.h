//
//  MapViewController.h
//  WhereAreYou
//
//  Created by Justin Cohen on 9/30/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate> {
    IBOutlet MKMapView *map;
    IBOutlet UITextView *textView;
    
    double lat;
    double lon;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate zoomLevel:(NSUInteger)zoomLevel animated:(BOOL)animated;
-(void)moveAnnotation;

@property (nonatomic, retain) IBOutlet MKMapView *map;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@end
