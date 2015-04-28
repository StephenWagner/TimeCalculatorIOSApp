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
@property (nonatomic) BOOL totalBeingDisplayed;

@end


@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    _calcController = [[SharedCalculatorController alloc]initWithLabel:_calculatorDisplay];
    _adBanner.delegate = self;
    self.totalBeingDisplayed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appendDigit:(UIButton *)sender {
    
    if (self.totalBeingDisplayed) {
        _calculatorDisplay.text = [_calcController clearDisplay];
        _totalBeingDisplayed = NO;
    }
    
    
    if (_calculatorDisplay.text.length > 10) {
        //do nothing (if the length of the display is getting too big
    }else{
        _calculatorDisplay.text = [_calcController appendDigit:sender];
    }
    
}

- (IBAction)doMath:(UIButton *)sender {

    NSString *displayBeforeCalculation = [[NSString alloc]initWithString:_calculatorDisplay.text];
    _calculatorDisplay.text = [_calcController doMath:sender stringSWTime:_calculatorDisplay.text];
    _timesInCalulationLabel.text = [_calcController listOfCalculations:sender currentListOfCalculations:_timesInCalulationLabel.text timeBeingAdded:displayBeforeCalculation];
    
    self.totalBeingDisplayed = YES;
    
}

- (IBAction)clear {
    if (!_calcController.firstCAClick) {
        _timesInCalulationLabel.text = @"";
    }
    _calculatorDisplay.text = [_calcController clear];
    self.totalBeingDisplayed = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"segueToTimePassed"]) {
        TimePassedViewController* timePassedVC = (TimePassedViewController*) segue.destinationViewController;
        timePassedVC.calcController = _calcController;
    }
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue{
    _calculatorDisplay.text = [_calcController.totalTime toString];
    
    if (!_calcController.totalTime) {
        _calculatorDisplay.text = [_calcController clearDisplay];
    }
    
    if (_calcController.buttonWithBorder.tag > 7) {
        [_calcController setOperatorFromUIButton:_equalButton];
        [_calcController setButtonBorder:_equalButton];
        _timesInCalulationLabel.text = [_calcController listOfCalculations:_equalButton currentListOfCalculations:_timesInCalulationLabel.text timeBeingAdded:_calcController.listOfTimes];
        self.totalBeingDisplayed = YES;
    }
}

#pragma mark - ADBannerView Delegate
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    
    NSLog(@"bannerViewDidLoadAd");
    if (banner.hidden) {
        banner.hidden = NO;
    }
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"didFailtoReceiveAdWithError, error: %@", error);
    banner.hidden = YES;
}


@end
