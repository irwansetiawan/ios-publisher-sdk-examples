//
//  AppDelegate.m
//  Mediation-Admob
//
//  Created by Irwan Setiawan on 14/12/20.
//

#import "AppDelegate.h"
@import GoogleMobileAds;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    GADMobileAds *ads = [GADMobileAds sharedInstance];
    [ads startWithCompletionHandler:^(GADInitializationStatus *status) {
      // Optional: Log each adapter's initialization latency.
      NSDictionary *adapterStatuses = [status adapterStatusesByClassName];
      for (NSString *adapter in adapterStatuses) {
        GADAdapterStatus *adapterStatus = adapterStatuses[adapter];
        NSLog(@"Adapter Name: %@, Description: %@, Latency: %f", adapter,
              adapterStatus.description, adapterStatus.latency);
      }

      // Start loading ads here...
    }];

    return YES;
}

@end
