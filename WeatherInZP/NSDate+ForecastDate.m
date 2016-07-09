//
//  NSDate+ForecastDate.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "NSDate+ForecastDate.h"

@implementation NSDate (ForecastDate)

+ (NSDate *)dateFromDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    [components setDay:day];
    
    if (month <= 0) {
        [components setMonth:12-month];
        [components setYear:year-1];
    } else if (month >= 13) {
        [components setMonth:month-12];
        [components setYear:year+1];
    } else {
        [components setMonth:month];
        [components setYear:year];
    }
    
    return [calendar dateFromComponents:components];
}

+ (NSString *)formatDateWithDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.M.yyyy"];
    return [formatter stringFromDate:date];
}

@end
