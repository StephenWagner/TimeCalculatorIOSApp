//
//  ViewController.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/26/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "CalculatorViewController.h"
#import "SharedCalculatorController.h"
#import "TimeCalculator.h"
#import "TimePassedViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (strong, nonatomic) SharedCalculatorController *calcController;

@end


@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    _calcController = [[SharedCalculatorController alloc]initWithLabel:_calculatorDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appendDigit:(UIButton *)sender {
    
    if ([_calculatorDisplay.text isEqualToString:[_calcController.totalTime toString]]) {
        _calculatorDisplay.text = [_calcController clearDisplay];
    }

    _calculatorDisplay.text = [_calcController appendDigit:sender];
}

- (IBAction)doMath:(UIButton *)sender {
    _calculatorDisplay.text = [_calcController doMath:sender stringSWTime:_calculatorDisplay.text];
}

- (IBAction)clear {
    _calculatorDisplay.text = [_calcController clear];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"segueToTimePassed"]) {
        TimePassedViewController* timePassedVC = (TimePassedViewController*) segue.destinationViewController;
        timePassedVC.calcController = _calcController;
    }
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue{
    _calculatorDisplay.text = [_calcController.totalTime toString];
    
    if (_calcController.buttonWithBorder.tag > 7) {
        UIButton *buttonToBorder;
        
        switch (_calcController.buttonWithBorder.tag) {
            case 8:
                buttonToBorder = _plusButton;
                break;
            default:
                buttonToBorder = _minusButton;
                break;
        }
        
        [_calcController setButtonBorder:buttonToBorder];
    }
}

@end
