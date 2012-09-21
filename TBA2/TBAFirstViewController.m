//
//  TBAFirstViewController.m
//  TBA2
//
//  Created by Jeff Carpenter on 9/18/12.
//  Copyright (c) 2012 Jeff Carpenter. All rights reserved.
//

#import "TBAFirstViewController.h"

@interface TBAFirstViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITabBarItem *firstButton;

@end

@implementation TBAFirstViewController
@synthesize webView;
@synthesize firstButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.firstButton.title = @"Stuff";

    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/mobile"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setFirstButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
