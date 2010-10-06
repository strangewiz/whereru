//
//  FindFriendViewController.m
//  WhereAreYou
//
//  Created by Justin Cohen on 9/30/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "FindFriendViewController.h"
#import "MapViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "Friend.h"

@implementation FindFriendViewController

@synthesize tableView, spinnerView, friendList;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView.allowsSelection = YES; // Keeps cells from being selectable while not editing. No more blue flash.

    
    friendList = [[NSMutableArray alloc] init];
    
    spinnerView.layer.cornerRadius = 20;
    CGPoint center = spinnerView.center;
    center.y += 100;
    spinnerView.center = center;

    [UIView beginAnimations : @"Display loading" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationBeginsFromCurrentState:FALSE];
   
    center = spinnerView.center;
    center.y -= 100;
    spinnerView.center = center;
    
    [UIView commitAnimations];

//    [self.view addSubview:spinnerView];

    //do we have saved friends list
    
    //if we do, show updating window, and get latest list
    
    //if we don't, show getting for the first time
    
    responseData = [[NSMutableData data] retain];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://justinsblog.net/whereareyou/user/1.json"]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


-(IBAction)findFriend:(id)sender {
    [self.navigationController pushViewController:[[[MapViewController alloc] init] autorelease] animated:true];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[[MapViewController alloc] init] autorelease] animated:true];    
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
}

#pragma mark -
#pragma mark Network layer 


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"Connection failed: %@", [error description]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
    
	NSDictionary *jsonValue = [responseString JSONValue];
    
    int version = [[jsonValue objectForKey:@"v"] intValue];
    NSLog(@"%d\n", version);
    NSArray *data = [jsonValue objectForKey:@"data"];

    
    for(NSDictionary* bundle in data) {
       [friendList addObject:[[[Friend alloc] initWithDictionary: bundle] autorelease]];
//          [friendList addObject:[[Friend alloc] initWithNameAndTimestampAndLatAndLon: key ts: [bundle objectAtIndex:0] la: [bundle objectAtIndex:1] lo: [bundle objectAtIndex:2]]];
//            NSLog(@"%@ has ", key);
//            NSLog(@"%@", [bundle objectAtIndex:0]);
//            NSLog(@"%@", [bundle objectAtIndex:1]);
//            NSLog(@"%@", [bundle objectAtIndex:2]);
    }
    
        [tableView reloadData]; 
        
        spinnerView.layer.cornerRadius = 20;
        CGPoint center = spinnerView.center;
        
        [UIView beginAnimations : @"Display loading" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationBeginsFromCurrentState:FALSE];
        
        center.y += 100;
        spinnerView.center = center;
        
        [UIView commitAnimations];


}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return friendList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"person"];
    
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"person"] autorelease];	
    }
    
    Friend *friend = (Friend *)[friendList objectAtIndex:indexPath.row];

    cell.textLabel.text = friend.name;
	return cell;
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)dealloc {
    [super dealloc];
}


@end
