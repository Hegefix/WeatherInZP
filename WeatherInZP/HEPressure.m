//
//  HEPressure.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEPressure.h"

@implementation HEPressure

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.max = [[dicitonary objectForKey:@"max"] integerValue];
        self.min = [[dicitonary objectForKey:@"min"] integerValue];
    }
    return self;
}

- (NSString *)pressureDescription {
    NSInteger averangePressure = (self.min+self.max)/2;
    return [NSString stringWithFormat:@"Давление: %li мм ртст", averangePressure];
}

@end
