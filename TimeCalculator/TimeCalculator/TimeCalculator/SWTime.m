//
//  SWTime.m
//  TimeCalculator
//
//  Created by Stephen Wagner on 1/28/15.
//  Copyright (c) 2015 Stephen Wagner. All rights reserved.
//

#import "SWTime.h"

@interface SWTime()

@end

@implementation SWTime

- (id)init{
    return [self initWithHours:0 andMinutes:0 andSeconds:0];
}

- (id)initWithHours: (NSInteger)hours andMinutes:(NSInteger)minutes{
    return [self initWithHours:hours andMinutes:minutes andSeconds:0];
}

- (id) initWithHours:(NSInteger)hours andMinutes:(NSInteger)minutes andSeconds:(NSInteger)seconds{
    self = [super init];
    self.hour = hours;
    self.min = minutes;
    self.sec = seconds;
    
    return self;
}

- (id)initUsingTotalTimeInMilliseconds: (long)totalMilliseconds{
    self = [super init];
    [self setWithTotalTimeInMilliseconds:totalMilliseconds];
    return self;
}

- (id)initUsingTotalTimeInSeconds: (NSInteger)totalSeconds{
    self = [super init];
    [self setWithTotalTimeInSeconds:totalSeconds];
    return self;
}

- (id)initWithString: (NSString*)input{
    
    NSArray *separatedInput = [input componentsSeparatedByString:@":"];
    int hour = [[separatedInput objectAtIndex:0] intValue];
    int min = [[separatedInput objectAtIndex:1] intValue];
    int sec = [[separatedInput objectAtIndex:2] intValue];
    
    return [self initWithHours:hour andMinutes:min andSeconds:sec];
}

- (NSString*)toString{
    NSString *hours = [NSString stringWithFormat:@"%02ld", (long)self.hour];
    NSString *minutes = [NSString stringWithFormat:@"%02ld", (long)self.min];
    NSString *seconds = [NSString stringWithFormat:@"%02ld", (long)self.sec];
    
    NSMutableString *result = [[NSMutableString alloc]initWithString:hours];
    
    [result appendString:@":"];
    [result appendString:minutes];
    [result appendString:@":"];
    [result appendString:seconds];
    
    return result;

}

- (void)setWithTotalTimeInSeconds: (NSInteger)totalSeconds{
    NSInteger remainder;
    self.hour = totalSeconds / 3600;
    remainder = totalSeconds % 3600;
    self.min = remainder / 60;
    self.sec = remainder % 60;

}

- (void)setWithTotalTimeInMilliseconds: (long)totalMilliseconds{
    NSInteger totalSeconds;
    
    totalMilliseconds = totalMilliseconds/1000;
    totalSeconds = (NSInteger)totalMilliseconds;
    
    [self setWithTotalTimeInSeconds:(totalSeconds)];
}

- (void)clear{
    self.hour = self.min = self.sec = 0;
}

- (NSInteger)getTotalTimeInSeconds{
    NSInteger secMin, secHour, totalSeconds;
    
    secMin = self.min * 60;
    secHour = self.hour * 3600;
    
    totalSeconds = secMin + secHour + self.sec;
    
    return totalSeconds;
}

@end
