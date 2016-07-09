//
//  HEForecast.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEForecast.h"
#import "NSDate+ForecastDate.h"

typedef NS_ENUM (NSUInteger, HEWeekdayEnum) {
    HEWeekdaySunday = 1,
    HEWeekdayMonday = 2,
    HEWeekdayTuesday = 3,
    HEWeekdayWednesday = 4,
    HEWeekdayThursday = 5,
    HEWeekdayFriday = 6,
    HEWeekdaySaturday = 7,
   
};

typedef NS_ENUM (NSInteger, HETimesOfDayEnum) {
    HENight = 0,
    HEMorning = 1,
    HEEvening = 2,
    HEAfternoon = 3,
};

@implementation HEForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self != nil) {
        self.heat = [[HEHeat alloc] initWithDictionary:[dictionary objectForKey:@"HEAT"]];
        self.phenomena = [[HEPhenomena alloc] initWithDictionary:[dictionary objectForKey:@"PHENOMENA"]];
        self.pressure = [[HEPressure alloc] initWithDictionary:[dictionary objectForKey:@"PRESSURE"]];
        self.rwet = [[HERwet alloc] initWithDictionary:[dictionary objectForKey:@"RELWET"]];
        self.wind = [[HEWind alloc] initWithDictionary:[dictionary objectForKey:@"WIND"]];
        self.temperature = [[HETemperature alloc] initWithDictionary:[dictionary objectForKey:@"TEMPERATURE"]];
        self.tod = [[dictionary objectForKey:@"tod"] integerValue];
        self.weekDay = [[dictionary objectForKey:@"weekday"] integerValue];
        self.hour = [[dictionary objectForKey:@"hour"] integerValue];
        
        NSInteger day = [[dictionary objectForKey:@"day"] integerValue];
        NSInteger month = [[dictionary objectForKey:@"month"] integerValue];
        NSInteger year = [[dictionary objectForKey:@"year"] integerValue];
        self.date = [NSDate dateFromDay:day month:month year:year];
    }
    return self;
}

- (NSString *)timeOfDayDescription {
    return [self _timesOfDayWithEnum:self.tod];
}

- (NSString *)weekDayDescription {
    return [self _dayNameWithEnum:self.weekDay];
}

#pragma mark - Private -

- (NSString *)_dayNameWithEnum:(HEWeekdayEnum)enumDay {
    
    switch (enumDay) {
            
        case HEWeekdayMonday:
            return @"Понедельник";
            break;
            
        case HEWeekdayTuesday:
            return @"Вторник";
            break;
            
        case HEWeekdayWednesday:
            return @"Среда";
            break;
            
        case HEWeekdayThursday:
            return @"Четверг";
            break;
            
        case HEWeekdayFriday:
            return @"Пятница";
            break;
            
        case HEWeekdaySaturday:
            return @"Суббота";
            break;
            
        case HEWeekdaySunday:
            return @"Воскресенье";
            break;
            
        default:
            return @"Wrong day";
            break;
    }
}

- (NSString *)_timesOfDayWithEnum:(HETimesOfDayEnum)enumDayTime {
    
    switch (enumDayTime) {
            
        case HENight:
            return @"Ночь";
            break;
            
        case HEMorning:
            return @"Утро";
            break;
            
        case HEEvening:
            return @"День";
            break;
            
        case HEAfternoon:
            return @"Вечер";
            break;
            
        default:
            return @"Wrong day time";
            break;
    }
}

@end
