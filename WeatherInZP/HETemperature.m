//
//  HETemperature.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HETemperature.h"

@implementation HETemperature

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.max = [[dicitonary objectForKey:@"max"] integerValue];
        self.min = [[dicitonary objectForKey:@"min"] integerValue];
    }
    return self;
}

- (NSString *)temperatureDescription {
    return [NSString stringWithFormat:@"+%li ...+%li", self.min, self.max];
}

- (NSString *)averangeTemperatureDescription {
    NSInteger averangeTemperature = (self.max+self.min)/2;
    return [NSString stringWithFormat:@"+%li", averangeTemperature];
}

@end
