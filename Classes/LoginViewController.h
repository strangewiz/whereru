//
//  LoginViewController.h
//  WhereAreYou
//
//  Created by Justin Cohen on 9/29/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    IBOutlet UITableViewCell *username;
    IBOutlet UITableViewCell *password;
    IBOutlet UIBarButtonItem *saveButton;
    IBOutlet UIView *authOverlay;
    IBOutlet UIView *authOverlayMini;
    
    IBOutlet UITextField *usernameValue;
    IBOutlet UITextField *passwordValue;


    NSTimer *loginTimer;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *username;
@property (nonatomic, retain) IBOutlet UITableViewCell *password;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic, retain) IBOutlet UITextField *usernameValue;
@property (nonatomic, retain) IBOutlet UITextField *passwordValue;
@property (nonatomic, retain) IBOutlet UIView *authOverlay;
@property (nonatomic, retain) IBOutlet UIView *authOverlayMini;




-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)vChanged:(id)sender;


@end
