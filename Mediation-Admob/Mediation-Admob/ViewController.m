//
//  ViewController.m
//  Mediation-Admob
//
//  Created by Irwan Setiawan on 14/12/20.
//

#import "ViewController.h"
@import GoogleMobileAds;

@interface ViewController ()

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // In this case, we instantiate the banner with desired ad size.
    self.bannerView = [[GADBannerView alloc]
        initWithAdSize:kGADAdSizeBanner];

    self.bannerView.adUnitID = @"ca-app-pub-8431190239499929/2379140810";
    self.bannerView.rootViewController = self;

    [self addBannerViewToView:self.bannerView];
}

- (IBAction)loadBannerTapped:(id)sender {
    [self.bannerView loadRequest:[GADRequest request]];
}

- (void)addBannerViewToView:(UIView *)bannerView {
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.bottomLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:0],
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0]
                                ]];
}


@end
