//
//  NSObject+SharedCalculatorController.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 2/7/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTime.h"

@interface SharedCalculatorController: NSObject //<UIPickerViewDelegate>

@property BOOL firstCAClick;
@property (strong, nonatomic) UIButton *buttonWithBorder;
@property (strong, nonatomic) SWTime *totalTime;
@property (strong, nonatomic) NSString *listOfTimes;
- (instancetype)initWithLabel: (UILabel*) calcDisplay;
- (NSString*)appendDigit:(UIButton *)sender;
- (NSString*)doMath:(UIButton *)sender stringSWTime:(NSString*)timeString;
- (NSString*)clearDisplay;
- (NSString*)clear;
-(void)setButtonBorder: (UIButton *)sender;
-(NSString*) listOfCalculations: (UIButton*)sender currentListOfCalculations:(NSString*)currentList timeBeingAdded:(NSString*) timeBeingAdded;
-(void)setOperatorFromUIButton:(UIButton *)sender;

@end
