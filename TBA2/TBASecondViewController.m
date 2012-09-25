//
//  TBASecondViewController.m
//  TBA2
//
//  Created by Jeff Carpenter on 9/18/12.
//  Copyright (c) 2012 Jeff Carpenter. All rights reserved.
//

#import "TBASecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TBASecondViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *diningHallView;
@property (weak, nonatomic) IBOutlet UIButton *danaButton;
@property (weak, nonatomic) IBOutlet UIButton *fossButton;
@property (weak, nonatomic) IBOutlet UIButton *bobsButton;
@property (strong, nonatomic) IBOutlet UITabBarItem *secondButton;
@end

@implementation TBASecondViewController
@synthesize scrollView;
@synthesize diningHallView;
@synthesize danaButton;
@synthesize fossButton;
@synthesize bobsButton;
@synthesize secondButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [fossButton setTitleColor:[UIColor colorWithWhite: 1 alpha: 1.0] forState:UIControlStateNormal];
    [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
    [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];

    [fossButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
    [danaButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
    [bobsButton setTitleColor:[UIColor colorWithWhite: 0.2 alpha: 1.0] forState:UIControlStateHighlighted];
    
    NSInteger numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++) {
        
        CGFloat xOrigin = i * scrollView.frame.size.width;
        UIWebView *awesomeView = [[UIWebView alloc] initWithFrame:CGRectMake(xOrigin, 0, scrollView.frame.size.width, scrollView.frame.size.height)];

        NSURL *url;
        if (i == 0) {
            url = [NSURL URLWithString:@"http://announcements.io/mobile/foss"];
        } else if (i == 1) {
            url = [NSURL URLWithString:@"http://announcements.io/mobile/dana"];
        } else if (i == 2) {
            url = [NSURL URLWithString:@"http://announcements.io/mobile/bobs"];
        }

        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [awesomeView loadRequest:requestObj];
        
        [scrollView addSubview:awesomeView];
    }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfViews, scrollView.frame.size.height);
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
        [fossButton setTitleColor:[UIColor colorWithWhite: 1 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
    } else if (page == 1) {
        [fossButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 1 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
    } else if (page == 2) {
        [fossButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [danaButton setTitleColor:[UIColor colorWithWhite: 0.1 alpha: 1.0] forState:UIControlStateNormal];
        [bobsButton setTitleColor:[UIColor colorWithWhite: 1 alpha: 1.0] forState:UIControlStateNormal];
    }
}

- (void)viewDidUnload
{
    [self setSecondButton:nil];
    [self setScrollView:nil];
    [self setDiningHallView:nil];
    [self setDanaButton:nil];
    [self setFossButton:nil];
    [self setBobsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
