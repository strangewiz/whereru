//
//  RootViewController.m
//  WhereAreYou
//
//  Created by Justin Cohen on 9/29/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@implementation RootViewController

- (void)viewDidLoad {

    UIBarButtonItem * loginButton = [[[UIBarButtonItem alloc]
                                      initWithTitle:@"Login" style:UIBarButtonItemStylePlain 
                                      target:self 
                                      action:@selector( loginAction: ) ] autorelease];
    
    self.navigationItem.rightBarButtonItem = loginButton;
    
    UIBarButtonItem * registerButton = [[[UIBarButtonItem alloc]
                                      initWithTitle:@"Register" style:UIBarButtonItemStylePlain 
                                      target:self 
                                      action:@selector( registerAction: ) ] autorelease];
    
    self.navigationItem.leftBarButtonItem = registerButton;
    
    [super viewDidLoad];
}



-(void) registerAction:(id)sender {
    [self.navigationController pushViewController:[[[RegisterViewController alloc] init] autorelease] animated:true];
}


-(void) loginAction:(id)sender {
    [self.navigationController presentModalViewController:[[[LoginViewController alloc] init] autorelease]  animated:true];
//    [self.navigationController pushViewController:[[[LoginViewController alloc] init] autorelease] animated:true];
}


-(IBAction)login:(id)sender {
//    [self.navigationController pushViewController:[[[LoginViewController alloc] init] autorelease] animated:true];
}

-(IBAction)showMain:(id)sender {
    [[[UIApplication sharedApplication] delegate] showMain];

}



/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {

    [super dealloc];
}

@end
