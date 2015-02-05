//
//  ViewController.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/26/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

- (IBAction)appendDigit:(UIButton *)sender;
- (NSString*) formatDisplay: (NSString*)stringToFormat;
- (IBAction)clear;

@end

