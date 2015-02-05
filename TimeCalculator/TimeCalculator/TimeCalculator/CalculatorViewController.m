//
//  ViewController.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/26/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "CalculatorViewController.h"
#import "SWTime.h"
#import "TimeCalculator.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (nonatomic) BOOL firstCAClick;
@property (strong, nonatomic) SWTime *totalTime;
@property (strong, nonatomic) TimeCalculator *calculator;
@property (strong, nonatomic) SWTime *timeArgument, *timeArg2;
@property (nonatomic) int operator; //1:plus, 2:minus, 3:multiply, 4:equals
@property (strong, nonatomic) UIButton *buttonWithBorder;

@end


@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    _firstCAClick = YES;
    _calculator = [[TimeCalculator alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appendDigit:(UIButton *)sender {
    _firstCAClick = YES;
    
    if ([_calculatorDisplay.text isEqualToString:[_totalTime toString]]) {
        [self clearDisplay];
    }
    NSString *digit = sender.currentTitle;
    NSMutableString *toDisplay = [[NSMutableString alloc]init];

    [toDisplay appendString: [_calculatorDisplay.text stringByReplacingOccurrencesOfString:@":" withString:@""]];
    [toDisplay appendString:digit];
    
    if ([toDisplay hasPrefix:@"0"]) {
        [toDisplay setString:[toDisplay substringFromIndex:1]];
    }
    
    _calculatorDisplay.text = [self formatDisplay:toDisplay];
}

- (IBAction)clear {
    [self clearDisplay];
    
    if(_firstCAClick){
        _firstCAClick = NO;
    }else{
        _totalTime = nil;
        [[_buttonWithBorder layer]setBorderWidth:0.0f];
        _buttonWithBorder = nil;
        _firstCAClick = YES;
    }
}

- (IBAction)doMath:(UIButton *)sender {

    _timeArgument = [[SWTime alloc]initWithString:_calculatorDisplay.text];
    [[_buttonWithBorder layer]setBorderWidth:0.0f];
    [[sender layer]setBorderWidth:1.5f];
    _buttonWithBorder = sender;

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
    _calculatorDisplay.text = [_totalTime toString];

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

- (void)clearDisplay{
    _calculatorDisplay.text = [self formatDisplay:@"000000"];
}

- (NSString*) formatDisplay: (NSString*)stringToFormat{
    NSMutableString *formattedString = [NSMutableString stringWithString:stringToFormat];
    [formattedString insertString:@":" atIndex: formattedString.length-2];
    [formattedString insertString:@":" atIndex:formattedString.length-5];
    return formattedString;
}
@end
