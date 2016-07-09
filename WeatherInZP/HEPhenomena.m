//
//  HEPhemomena.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEPhenomena.h"

typedef NS_ENUM (NSInteger, HECloudinessEnum) {
    HEClear = 0,
    HEMainlyClear = 1,
    HEPartlyCloudy = 2,
    HECloudy = 3
};

typedef NS_ENUM (NSInteger, HEPrecipitationEnum) {
    HERain = 4,
    HEHeavyRain = 5,
    HEShow = 6,
    HEHeavyShow = 7,
    HEThunderstorm = 8,
    HENoData = 9,
    HENoPrecipitation = 10
};

@implementation HEPhenomena

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.cloudiness = [[dicitonary objectForKey:@"cloudiness"] integerValue];
        self.rpower = [[dicitonary objectForKey:@"rpower"] integerValue];
        self.spower = [[dicitonary objectForKey:@"spower"] integerValue];
        self.precipitation = [[dicitonary objectForKey:@"precipitation"] integerValue];
    }
    return self;
}

- (NSString *)cloudinessDescription {
    return [self _cloudinessWithEnum:self.cloudiness];
}

- (NSString *)precipitationDescription {
    
    NSString *precipitationSting = nil;
    if (self.precipitation == 4 || self.precipitation == 5 || self.precipitation == 6 || self.precipitation == 7) {
        if (self.rpower == 0) {
            precipitationSting = [NSString stringWithFormat:@"Возможен %@", [self _precipitationWithEnum:self.precipitation]];
        } else {
            precipitationSting = [self _precipitationWithEnum:self.precipitation];
        }
    } else if (self.precipitation == 8) {
        if (self.rpower == 0) {
            precipitationSting = [NSString stringWithFormat:@"Возможна %@", [self _precipitationWithEnum:self.precipitation]];
        } else {
            precipitationSting = [self _precipitationWithEnum:self.precipitation];
        }
    } else {
        precipitationSting = [self _precipitationWithEnum:self.precipitation];
    }
    return precipitationSting;
}

#pragma mark - Private -

- (NSString *)_cloudinessWithEnum:(HECloudinessEnum)cloudinesEnum {
    
    switch (cloudinesEnum) {
        case HEClear:
            return @"Ясно";
            break;
         
        case HEMainlyClear:
            return @"Малооблачно";
            break;
            
        case HEPartlyCloudy:
            return @"Переменная облачность";
            break;
            
        case HECloudy:
            return @"Пасмурно";
            break;
            
        default:
            return @"Wrong cloudiness";
            break;
    }
}

- (NSString *)_precipitationWithEnum:(HEPrecipitationEnum)precipitationEnum {
    
    switch (precipitationEnum) {
        case HERain:
            return @"Дождь";
            break;
            
        case HEHeavyRain:
            return @"Ливень";
            break;
            
        case HEShow:
            return @"Снег";
            break;
            
        case HEHeavyShow:
            return @"Снегопад";
            break;
            
        case HEThunderstorm:
            return @"Гроза";
            break;
            
        case HENoData:
            return @"Нет данных";
            break;
            
        case HENoPrecipitation:
            return @"Без осадков";
            break;
            
        default:
            return @"Wrong weather";
            break;
    }
}

@end
