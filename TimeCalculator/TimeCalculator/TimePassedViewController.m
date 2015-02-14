//
//  TimePassedViewController.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 2/2/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "TimePassedViewController.h"

@interface TimePassedViewController ()

@property (strong, nonatomic) UIDatePicker *datePickerStart;
@property (strong, nonatomic) UIDatePicker *datePickerEnd;

@end

@implementation TimePassedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _totalTimeLabel.text = [_calcController.totalTime toString];
    [self initializeDatePickers];
    [self initializeTextFieldInputView:_datePickerStart textField:_startTimeTextField];
    [self initializeTextFieldInputView:_datePickerEnd textField:_endTimeTextField];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat: @"hh:mm:ss a, MM/dd/yy"];
    _endTimeTextField.text = _startTimeTextField.text = [formatter stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterDate:(UITextField *)sender {
    [self updateTextField:_datePickerStart];
}

- (IBAction)done:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)doMath:(UIButton *)sender {
    _totalTimeLabel.text = [_calcController doMath:sender stringSWTime:_timeElapsedLabel.text];
}

- (void) initializeDatePickers{
    _datePickerStart = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    _datePickerStart.backgroundColor = [UIColor whiteColor];
    _datePickerEnd = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    _datePickerEnd.backgroundColor = [UIColor whiteColor];
}

- (void) initializeTextFieldInputView:(UIDatePicker*)datePicker textField:(UITextField*)textField {
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [textField setInputView:datePicker];
}

- (void) updateTextField:(UIDatePicker*)sender{

    UIDatePicker *picker = sender;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat: @"hh:mm:ss a, MM/dd/yy"];
    NSString *timeFormatted = [[NSString alloc]init];

    timeFormatted = [NSString stringWithFormat:@"%@", [formatter stringFromDate:picker.date]];
    
    if (sender == _datePickerStart) {
        _startTimeTextField.text = timeFormatted;
    }else{
        _endTimeTextField.text = timeFormatted;
    }
    
    NSTimeInterval interval = [_datePickerEnd.date timeIntervalSinceDate:_datePickerStart.date];
    
    
    SWTime *timePassed = [[SWTime alloc]initUsingTotalTimeInSeconds: (NSInteger)interval];
    _timeElapsedLabel.text = [timePassed toString];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_startTimeTextField resignFirstResponder];
    [_endTimeTextField resignFirstResponder];
}



@end
