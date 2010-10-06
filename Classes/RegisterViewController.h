//
//  RegisterViewController.h
//  WhereAreYou
//
//  Created by Justin Cohen on 10/5/10.
//  Copyright (c) 2010 Student. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;

}

@property (nonatomic, retain) IBOutlet UIWebView *webView;


@end
