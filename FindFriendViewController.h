//
//  FindFriendViewController.h
//  WhereAreYou
//
//  Created by Justin Cohen on 9/30/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"



@interface FindFriendViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableView;
    NSMutableData *responseData;
    IBOutlet UIView *spinnerView;
    NSMutableArray *friendList;

}


@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIView *spinnerView;
@property (nonatomic, retain) NSMutableArray *friendList;

- (IBAction) findFriend:(id)sender;

@end
