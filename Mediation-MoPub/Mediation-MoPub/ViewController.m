//
//  ViewController.m
//  Mediation-MoPub
//
//  Created by Irwan Setiawan on 14/12/20.
//

#import "ViewController.h"
#import "MoPub.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)loadBanner {

    self.adView = [[MPAdView alloc] initWithAdUnitId:@"5f6c4592630f4f96bc3106b6ed0cc3f1"];
    self.adView.delegate = self;
    // Ensure the adView's parent has a size set in order to use kMPPresetMaxAdSizeMatchFrame. Otherwise, give your adView's frame a specific size (e.g. 320 x 50)
    self.adView.frame = CGRectMake(0, 0, kMPPresetMaxAdSizeMatchFrame.width, kMPPresetMaxAdSizeMatchFrame.height);
    [self.view addSubview:self.adView];

    // You can pass in specific width and height to be requested
    //[self.adView loadAdWithMaxAdSize:custom_CGSize];
    // Or you can use one of the height-based constants
    [self.adView loadAdWithMaxAdSize:kMPPresetMaxAdSize50Height];
    // Alternatively, you can use the frame as the maximum ad size
    //[self.adView loadAdWithMaxAdSize:kMPPresetMaxAdSizeMatchFrame];

}


@end
