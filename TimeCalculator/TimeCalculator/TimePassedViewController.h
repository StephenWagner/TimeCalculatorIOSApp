//
//  TimePassedViewController.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 2/2/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedCalculatorController.h"

@interface TimePassedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *startTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *endTimeTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeElapsedLabel;
@property (weak, nonatomic) SharedCalculatorController *calcController;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@end
