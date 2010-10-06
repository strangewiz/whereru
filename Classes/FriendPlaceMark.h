//
//  FriendPlaceMark.h
//  WhereAreYou
//
//  Created by Justin Cohen on 9/30/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface FriendPlaceMark : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;
- (NSString *)subtitle;
- (NSString *)title;

@end
