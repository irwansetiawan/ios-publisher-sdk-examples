//
//  ViewController.h
//  Mediation-MoPub
//
//  Created by Irwan Setiawan on 14/12/20.
//

#import <UIKit/UIKit.h>
#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
#import <MoPubSDKFramework/MoPub.h>
#else
#import "MoPub.h"
#endif

@interface ViewController : UIViewController

@property (nonatomic) MPAdView *adView;

@end

