//
//  HEWind.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEWind.h"

@implementation HEWind

typedef NS_ENUM (NSInteger, HEWindDirectionEnum) {
    HEWindDirectionNorth = 0,
    HEWindDirectionNorthEast = 1,
    HEWindDirectionEast = 2,
    HEWindDirectionSouthEast = 3,
    HEWindDirectionSouth = 4,
    HEWindDirectionSouthWest = 5,
    HEWindDirectionWest = 6,
    HEWindDirectionNorthWest = 7
};

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.direction = [[dicitonary objectForKey:@"direction"] integerValue];
        self.max = [[dicitonary objectForKey:@"max"] integerValue];
        self.min = [[dicitonary objectForKey:@"min"] integerValue];
    }
    return self;
}

- (NSString *)windDescription {
    NSString *directionStr = [self _windDirectionWithEnum:self.direction];
    NSString *speedStr = [NSString stringWithFormat:@"%li-%li м/с", self.min, self.max];
    return [NSString stringWithFormat:@"Ветер: %@, %@", directionStr, speedStr];
}

#pragma mark - Private -

- (NSString *)_windDirectionWithEnum:(HEWindDirectionEnum)windDirectionEnum {
    
    switch (windDirectionEnum) {
        case HEWindDirectionNorth:
            return @"Северный";
            break;
            
        case HEWindDirectionNorthEast:
            return @"Северо-восточный";
            break;
            
        case HEWindDirectionEast:
            return @"Восточный";
            break;
            
        case HEWindDirectionSouthEast:
            return @"Юго-восточный";
            break;
            
        case HEWindDirectionSouth:
            return @"Южный";
            break;
            
        case HEWindDirectionSouthWest:
            return @"Юго-западный";
            break;
            
        case HEWindDirectionWest:
            return @"Западный";
            break;
            
        case HEWindDirectionNorthWest:
            return @"Северо-западный";
            
        default:
            return @"Wrong wind direction";
            break;
    }
}


@end
