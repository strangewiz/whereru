//
//  FriendPlaceMark.m
//  WhereAreYou
//
//  Created by Justin Cohen on 9/30/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "FriendPlaceMark.h"


@implementation FriendPlaceMark

@synthesize  coordinate;

- (NSString *)subtitle{
	return @"Put some text here";
}
- (NSString *)title{
	return @"Parked Location";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

@end
