//
//  InterstitialViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "InterstitialViewController.h"
#import "AdConfigurations.h"
@import GoogleMobileAds;
@import CriteoPublisherSdk;

@interface InterstitialViewController () <GADInterstitialDelegate>

@property(nonatomic, strong) DFPInterstitial *interstitial;
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interstitial = [[DFPInterstitial alloc] initWithAdUnitID:[AdConfigurations gamInterstitialAdUnitId]];
    self.interstitial.delegate = self;

    [self loadInterstitial];
}

- (void)loadInterstitial {
    [[Criteo sharedCriteo] loadBidForAdUnit:[AdConfigurations criteoInterstitialAdUnit] responseHandler:^(CRBid *bid) {
        // existing Ad Manager request
        DFPRequest *request = [DFPRequest request];

        if (bid != nil) {
            // add Criteo bids into Ad Manager request
            [[Criteo sharedCriteo] enrichAdObject:request withBid:bid];
        }

        // load Interstitial ad
        [self.interstitial loadRequest:request];
    }];
}

- (IBAction)displayInterstitial {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
        self.displayInterstitialButton.enabled = NO;
    }
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    self.displayInterstitialButton.enabled = YES;
    [self.displayInterstitialButton setTitle:@"Display Interstitial" forState:UIControlStateNormal];
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    self.displayInterstitialButton.enabled = NO;
    [self.displayInterstitialButton setTitle:@"Ad Failed to Load" forState:UIControlStateNormal];
}

@end
