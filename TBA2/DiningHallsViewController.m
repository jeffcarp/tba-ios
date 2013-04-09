//
//  DiningHallsViewController.m
//  TBA2
//
//  Created by Jeff Carpenter on 9/18/12.
//  Copyright (c) 2012 Jeff Carpenter. All rights reserved.
//

#import "DiningHallsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DiningHallsViewController () <UIScrollViewDelegate, UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *diningHallView;
@property (weak, nonatomic) IBOutlet UIButton *danaButton;
@property (weak, nonatomic) IBOutlet UIButton *fossButton;
@property (weak, nonatomic) IBOutlet UIButton *bobsButton;
@property (strong, nonatomic) IBOutlet UITabBarItem *secondButton;
@end

@implementation DiningHallsViewController
@synthesize scrollView;
@synthesize diningHallView;
@synthesize danaButton;
@synthesize fossButton;
@synthesize bobsButton;
@synthesize secondButton;

- (id)init
{
    self = [super init];
    if(self)
    {
        UIImage* anImage = [UIImage imageNamed:@"125-food.png"];
        UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Dining Halls" image:anImage tag:1];
        self.tabBarItem = theItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
//    // Initialize dining hall picker bar
//        
//    [fossButton setTitleColor:[UIColor colorWithWhite: 1 alpha: 1.0] forState:UIControlStateNormal];
//    [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
//    [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
//
//    [fossButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
//    [danaButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
//    [bobsButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
//    
//    // Spin up loading spinners
//    
//    [scrollView setBackgroundColor:[UIColor darkGrayColor]];
//
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    
//    // 3 views for 3 dining halls
//    NSInteger numberOfViews = 3;
//    
//    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfViews, scrollView.frame.size.height);
//    
//    for (int i = 0; i < numberOfViews; i++) {
//        
//        CGFloat xOrigin = i * scrollView.frame.size.width;
//        CGFloat xCenter = self.view.center.x + (self.view.bounds.size.width * i);
//        
//        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        activityIndicator.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
//        activityIndicator.center = CGPointMake(xCenter, self.view.center.y-50.0);
//        activityIndicator.tag = i+1;
//        [scrollView addSubview:activityIndicator];
//        
//        [activityIndicator startAnimating];
//        activityIndicator.hidden = FALSE;
//        
//        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(xOrigin, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
//        webView.delegate = self;
//        
//        NSURL *url;
//        if (i == 0) {
//            url = [NSURL URLWithString:@"http://announcements.io/mobile/foss"];
//        } else if (i == 1) {
//            url = [NSURL URLWithString:@"http://announcements.io/mobile/dana"];
//        } else if (i == 2) {
//            url = [NSURL URLWithString:@"http://announcements.io/mobile/bobs"];
//        }
//
//        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//        [webView loadRequest:requestObj];
//        webView.hidden = TRUE;
//        webView.tag = i+4;
//        [scrollView addSubview:webView];
//    }
}

- (BOOL)canBecomeFirstResponder
{
    return true;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self resignFirstResponder];
}

- (IBAction)fossButton:(id)sender {
    CGPoint leftOffset = CGPointMake(scrollView.frame.size.width * 0, 0);
    [scrollView setContentOffset:leftOffset animated:YES];
}

- (IBAction)danaButton:(id)sender {
    CGPoint leftOffset = CGPointMake(scrollView.frame.size.width * 1, 0);
    [scrollView setContentOffset:leftOffset animated:YES];
}

- (IBAction)bobButton:(id)sender {
    CGPoint leftOffset = CGPointMake(scrollView.frame.size.width * 2, 0);
    [scrollView setContentOffset:leftOffset animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollViewPassed {
    CGFloat pageWidth = scrollViewPassed.frame.size.width;
    float fractionalPage = scrollViewPassed.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    if (page == 0) {
        [fossButton setTitleColor:[UIColor colorWithWhite: 1.0 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
    } else if (page == 1) {
        [fossButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 1.0 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
    } else if (page == 2) {
        [fossButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 1.0 alpha: 1.0] forState:UIControlStateNormal];
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // shake it like a salt shaker
    if (motion == UIEventSubtypeMotionShake) {

        UIWebView *fossWebView = (UIWebView *)[scrollView viewWithTag:4];
        fossWebView.hidden = YES;
        
        UIWebView *danaWebView = (UIWebView *)[scrollView viewWithTag:5];
        danaWebView.hidden = YES;
        
        UIWebView *bobsWebView = (UIWebView *)[scrollView viewWithTag:6];
        bobsWebView.hidden = YES;
        
        // start activity indicators (I believe the center one been spinning this whole time)
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        // send another request
        
        NSURL *fossUrl = [NSURL URLWithString:@"http://announcements.io/mobile/foss"];
        NSURLRequest *fossRequestObj = [NSURLRequest requestWithURL:fossUrl];
        [fossWebView loadRequest:fossRequestObj];
        
        NSURL *danaUrl = [NSURL URLWithString:@"http://announcements.io/mobile/dana"];
        NSURLRequest *danaRequestObj = [NSURLRequest requestWithURL:danaUrl];
        [danaWebView loadRequest:danaRequestObj];
        
        NSURL *bobsUrl = [NSURL URLWithString:@"http://announcements.io/mobile/bobs"];
        NSURLRequest *bobsRequestObj = [NSURLRequest requestWithURL:bobsUrl];
        [bobsWebView loadRequest:bobsRequestObj];
        
        // webViewDidFinishLoad will handle it from there        
    }
    [super motionEnded:motion withEvent:event];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
       
    webView.hidden = NO;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)viewDidUnload
{
    // Release subviews
    [self setSecondButton:nil];
    [self setScrollView:nil];
    [self setDiningHallView:nil];
    [self setDanaButton:nil];
    [self setFossButton:nil];
    [self setBobsButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
