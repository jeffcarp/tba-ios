//
//  TBAFirstViewController.m
//  TBA2
//
//  Created by Jeff Carpenter on 9/18/12.
//  Copyright (c) 2012 Jeff Carpenter. All rights reserved.
//

#import "TBAFirstViewController.h"

@interface TBAFirstViewController () <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITabBarItem *firstButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation TBAFirstViewController

@synthesize webView;
@synthesize firstButton;
@synthesize activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self deployActivityIndicator];
    
    // Start loading Web View
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-49.0)];
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://announcements.io/mobile/dashboard"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self removeActivityIndicator];
    
    [self.view addSubview:self.webView];
    [self.view bringSubviewToFront:self.webView];
}

-(void)deployActivityIndicator
{
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.activityIndicator.center = CGPointMake(self.view.center.x, self.view.center.y-50.0);
    [self.view addSubview:self.activityIndicator];
    
    [self.view bringSubviewToFront:self.activityIndicator];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidden = FALSE;
}

-(void)removeActivityIndicator
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = TRUE;
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setFirstButton:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
