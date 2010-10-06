//
//  Friend.m
//  WhereAreYou
//
//  Created by Justin Cohen on 10/4/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "Friend.h"


@implementation Friend

@synthesize name, lat, lon, timestamp, id;


-(id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.name = [dict objectForKey:@"name"];
        self.id =   [dict objectForKey:@"id"];
        self.timestamp =  [dict objectForKey:@"ts"];
        self.lat = [dict objectForKey:@"lat"];
        self.lon = [dict objectForKey:@"lon"];
    }
    return self;
}

@end
