//
//  LoginViewController.m
//  WhereAreYou
//
//  Created by Justin Cohen on 9/29/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "LoginViewController.h"
#import "WhereAreYouAppDelegate.h"
#import "QuartzCore/QuartzCore.h"


@implementation LoginViewController


@synthesize username, password, saveButton, usernameValue, passwordValue, authOverlay, authOverlayMini;


- (void)viewDidLoad {
    saveButton.enabled = false;
    
    
    [username setSelectionStyle:UITableViewCellSelectionStyleNone];
    [password setSelectionStyle:UITableViewCellSelectionStyleNone];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == passwordValue) {
        if(saveButton.enabled) {
            [self save:NULL];
        }
    } else {
        [passwordValue becomeFirstResponder];
    }
    return YES;
}
-(IBAction)vChanged:(id)sender
{
    if(usernameValue.text.length > 0 && passwordValue.text.length > 0)
        saveButton.enabled = true;
    else
        saveButton.enabled = false;
}

-(IBAction)cancel:(id)sender
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(IBAction)save:(id)sender
{
    [usernameValue resignFirstResponder];
    [passwordValue resignFirstResponder];

    authOverlayMini.layer.cornerRadius = 10;
    [self.view addSubview:authOverlay];
    
    
    /*
    myApp.loginString    = (NSMutableString*)[[NSUserDefaults standardUserDefaults] stringForKey:kloginKey];
    myApp.passwordString = (NSMutableString*)[[NSUserDefaults standardUserDefaults] stringForKey:kpasswordKey];
    
    NSMutableString *dataStr = (NSMutableString*)[@"" stringByAppendingFormat:@"%@:%@", myApp.loginString, myApp.passwordString];
    
    NSData *encodeData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    char encodeArray[512];
    
    memset(encodeArray, '\0', sizeof(encodeArray));
    
    // Base64 Encode username and password
    encode([encodeData length], (char *)[encodeData bytes], sizeof(encodeArray), encodeArray);
    
    dataStr = [NSString stringWithCString:encodeArray length:strlen(encodeArray)];
    myApp.authenticationString = [@"" stringByAppendingFormat:@"Basic %@", dataStr];
    
    // Create asynchronous request
    NSMutableURLRequest * theRequest=(NSMutableURLRequest*)[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.somewebdomain.com"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [theRequest addValue:myApp.authenticationString forHTTPHeaderField:@"Authorization"];
    
    NSURLConnection * theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (theConnection) {
        receivedData = [[NSMutableData data] retain];
    }
    else {
        [myApp addTextToLog:@"Could not connect to the network" withCaption:@"MyApp"];
    }
    */

    loginTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(finishLogin) userInfo:nil repeats:NO];

}

- (void) finishLogin
{
    [self.parentViewController dismissModalViewControllerAnimated:NO];
    [[[UIApplication sharedApplication] delegate] showMain];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if([indexPath row] == 0) return username;
    if([indexPath row] == 1) return password;
    return nil;

}


- (void)dealloc {
    [super dealloc];
}


@end
