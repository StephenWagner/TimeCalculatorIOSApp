//
//  TimeCalculator.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/30/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWTime.h"

@interface TimeCalculator : NSObject

- (SWTime*) timePassed: (SWTime*)beginTime andEndTime:(SWTime*)endTime;
- (SWTime*) timePassedWithNSDate: (NSDate*)beginDate andEndDate:(NSDate*)endDate;
- (SWTime*) addTime: (SWTime*)firstTime andSecondTime:(SWTime*)secondTime;
- (SWTime*) subtractTime: (SWTime*)timeToSubtract subtractFromThisBiggerNumber:(SWTime*)time;
- (SWTime*) multilplyTime: (SWTime*)time timeToMultiply:(int)multiplyBy;

@end
