//
//  HEForecast.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEHeat.h"
#import "HEPhenomena.h"
#import "HEPressure.h"
#import "HERwet.h"
#import "HEWind.h"
#import "HETemperature.h"

@interface HEForecast : NSObject

@property (strong, nonatomic) HEHeat *heat;
@property (strong, nonatomic) HEPhenomena *phenomena;
@property (strong, nonatomic) HEPressure *pressure;
@property (strong, nonatomic) HERwet *rwet;
@property (strong, nonatomic) HEWind *wind;
@property (strong, nonatomic) HETemperature *temperature;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger tod;
@property (nonatomic) NSInteger weekDay;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)timeOfDayDescription;
- (NSString *)weekDayDescription;

@end
