//
//  SWTime.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/28/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTime : NSObject

@property (nonatomic) int hour;
@property (nonatomic) int min;
@property (nonatomic) int sec;

- (id)initWithHours: (int)hours andMinutes:(int)minutes;
- (id) initWithHours:(int)hours andMinutes:(int)minutes andSeconds:(int)seconds;
- (id)initUsingTotalTimeInMilliseconds: (long)totalMilliseconds;
- (id)initUsingTotalTimeInSeconds: (int)totalSeconds;
- (id)initWithString: (NSString*)aString;

- (NSString*)toString;
- (void)setWithTotalTimeInSeconds: (int)totalSeconds;
- (void)setWithTotalTimeInMilliseconds: (long)totalMilliseconds;
- (void)clear;
- (int)getTotalTimeInSeconds;

@end
