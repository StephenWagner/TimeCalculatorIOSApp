//
//  SWTime.h
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/28/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTime : NSObject

@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger min;
@property (nonatomic) NSInteger sec;

- (id)initWithHours: (NSInteger)hours andMinutes:(NSInteger)minutes;
- (id) initWithHours:(NSInteger)hours andMinutes:(NSInteger)minutes andSeconds:(NSInteger)seconds;
- (id)initUsingTotalTimeInMilliseconds: (long)totalMilliseconds;
- (id)initUsingTotalTimeInSeconds: (NSInteger)totalSeconds;
- (id)initWithString: (NSString*)aString;

- (NSString*)toString;
- (void)setWithTotalTimeInSeconds: (NSInteger)totalSeconds;
- (void)setWithTotalTimeInMilliseconds: (long)totalMilliseconds;
- (void)clear;
- (NSInteger)getTotalTimeInSeconds;

@end
