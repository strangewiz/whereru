//
//  Friend.h
//  WhereAreYou
//
//  Created by Justin Cohen on 10/4/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Friend : NSObject {
    NSString *name;
    NSString *id;
    NSNumber *timestamp;
    NSNumber *lat;
    NSNumber *lon;
}


-(id)initWithDictionary: (NSDictionary*) dict;

@property (retain) NSString* name; 
@property (retain) NSString* id; 
@property (retain) NSNumber* timestamp;
@property (retain) NSNumber* lat;
@property (retain) NSNumber* lon;

@end
