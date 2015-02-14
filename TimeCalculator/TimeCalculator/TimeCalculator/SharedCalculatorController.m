//
//  NSObject+SharedCalculatorController.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 2/7/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "SharedCalculatorController.h"
#import "TimeCalculator.h"
#import <UIKit/UIKit.h>

@interface SharedCalculatorController()

@property BOOL firstCAClick;
@property (strong, nonatomic) NSString* textToDisplay;
@property (weak, nonatomic) UILabel *calculatorDisplay;
@property (strong, nonatomic) SWTime *timeArgument, *timeArg2;
@property int operator;//1:plus, 2:minus, 3:multiply, 4:equals
@property (strong, nonatomic) TimeCalculator *calculator;

@end


@implementation SharedCalculatorController



- (instancetype)initWithLabel: (UILabel*) calcDisplay{
    self = [super init];
    _calculatorDisplay = calcDisplay;
    _firstCAClick = YES;
    _calculator = [[TimeCalculator alloc]init];

    return self;
}

- (NSString*)appendDigit:(UIButton *)sender {
    self.firstCAClick = YES;
    
    NSString *digit = sender.currentTitle;
    NSMutableString *toDisplay = [[NSMutableString alloc]init];
    
    [toDisplay appendString: [_calculatorDisplay.text stringByReplacingOccurrencesOfString:@":" withString:@""]];
    [toDisplay appendString:digit];
    
    if ([toDisplay hasPrefix:@"0"]) {
        [toDisplay setString:[toDisplay substringFromIndex:1]];
    }
    
    return [self formatDisplay:toDisplay];
}


- (NSString*)clear {
    
    if(_firstCAClick){
        _firstCAClick = NO;
    }else{
        _totalTime = nil;
        [[_buttonWithBorder layer]setBorderWidth:0.0f];
        _buttonWithBorder = nil;
        _firstCAClick = YES;
    }
    
    return [self clearDisplay];
}

- (NSString*)doMath:(UIButton *)sender stringSWTime:(NSString*)timeString {
    
    _timeArgument = [[SWTime alloc]initWithString:timeString];
    [self setButtonBorder:sender];
    
    if (sender.tag > 7) {
        [self setOperatorFromUIButton:sender];
    }
    
    if (!_totalTime) {
        _totalTime = _timeArgument;
    }else{
        
        switch (_operator) {
            case 1://plus
                _totalTime = [_calculator addTime:_timeArgument andSecondTime:_totalTime];
                break;
            case 2://minus
                _totalTime = [_calculator subtractTime:_timeArgument subtractFromThisBiggerNumber:_totalTime];
                break;
            case 3://multiply
                break;
            default:
                break;
        }
        
    }
    
    [self setOperatorFromUIButton:sender];
    return [_totalTime toString];
    
}

-(void)setButtonBorder: (UIButton *)sender{
    [[_buttonWithBorder layer]setBorderWidth:0.0f];
    [[sender layer]setBorderWidth:1.5f];
    _buttonWithBorder = sender;
}

-(void)setOperatorFromUIButton:(UIButton *)sender{
    //1:plus, 2:minus, 3:multiply, 4:equals
    if ([sender.currentTitle isEqualToString:@"+"]) {
        _operator = 1;
    }else if ([sender.currentTitle isEqualToString:@"-"]){
        _operator = 2;
    }else if ([sender.currentTitle isEqualToString:@"x"]){
        _operator = 3;
    }else{
        _operator = 4;
    }
}


- (NSString*)clearDisplay{
    return [self formatDisplay:@"000000"];
}

- (NSString*) formatDisplay: (NSString*)stringToFormat{
    NSMutableString *formattedString = [NSMutableString stringWithString:stringToFormat];
    [formattedString insertString:@":" atIndex: formattedString.length-2];
    [formattedString insertString:@":" atIndex:formattedString.length-5];
    return formattedString;
}

@end
