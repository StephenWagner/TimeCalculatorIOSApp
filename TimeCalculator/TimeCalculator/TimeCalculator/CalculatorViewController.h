//
//  ViewController.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/26/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface CalculatorViewController : UIViewController <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *equalButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UILabel *timesInCalulationLabel;
@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

@end

