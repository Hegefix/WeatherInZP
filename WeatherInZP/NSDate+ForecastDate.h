//
//  NSDate+ForecastDate.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ForecastDate)

+ (NSDate *)dateFromDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;
+ (NSString *)formatDateWithDate:(NSDate *)date;

@end
