//
//  HEHeat.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEHeat.h"

@implementation HEHeat

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.max = [[dicitonary objectForKey:@"max"] integerValue];
        self.min = [[dicitonary objectForKey:@"min"] integerValue];
    }
    return self;
}

- (NSString *)heatDescription {
    return [NSString stringWithFormat:@"Комфортная температура: +%li ...+%li", self.min, self.max];
}

@end
