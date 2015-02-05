//
//  TimeCalculator.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/30/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "TimeCalculator.h"

@interface TimeCalculator()
@end

@implementation TimeCalculator

- (SWTime*) timePassed: (SWTime*)beginTime andEndTime:(SWTime*)endTime{
    SWTime *resultTime = [[SWTime alloc]init];
    int totalSeconds = [endTime getTotalTimeInSeconds] - [beginTime getTotalTimeInSeconds];
    
    [resultTime setWithTotalTimeInSeconds:totalSeconds];
    
    return resultTime;
}

- (SWTime*) timePassedWithNSDate: (NSDate*)beginDate andEndDate:(NSDate*)endDate{
    SWTime *resultTime = [[SWTime alloc]init];

    NSTimeInterval secondsBetween = [endDate timeIntervalSinceDate:beginDate];
    
    [resultTime setWithTotalTimeInSeconds:secondsBetween];
    
    return resultTime;
}

- (SWTime*) addTime: (SWTime*)firstTime andSecondTime:(SWTime*)secondTime{
    SWTime *resultTime = [[SWTime alloc]init];
    
    int totalSeconds = [secondTime getTotalTimeInSeconds] + [firstTime getTotalTimeInSeconds];
    
    [resultTime setWithTotalTimeInSeconds:totalSeconds] ;
    return resultTime;
}

- (SWTime*) subtractTime: (SWTime*)timeToSubtract subtractFromThisBiggerNumber:(SWTime*)time{
    SWTime *resultTime = [[SWTime alloc]init];
    int totalSeconds = [time getTotalTimeInSeconds] - [timeToSubtract getTotalTimeInSeconds];
    
    [resultTime setWithTotalTimeInSeconds:totalSeconds];
    return resultTime;
}

- (SWTime*) multilplyTime: (SWTime*)time timeToMultiply:(int)multiplyBy{
    SWTime *resultTime = [[SWTime alloc]init];
    int totalSeconds = [time getTotalTimeInSeconds] * multiplyBy;
    
    [resultTime setWithTotalTimeInSeconds:totalSeconds];
    return resultTime;
}

@end