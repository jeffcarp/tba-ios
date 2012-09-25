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

    NSURL *url = [NSURL URLWithString:@"http://announcements.io/mobile/dashboard"];

//    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"dashboard" ofType:@"html"];
//    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    [webView loadHTMLString:htmlString baseURL:baseURL];
    
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
