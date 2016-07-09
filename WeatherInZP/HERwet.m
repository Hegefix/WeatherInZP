//
//  HERelwet.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HERwet.h"

@implementation HERwet

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary {
    
    self = [super init];
    if (self != nil) {
        self.max = [[dicitonary objectForKey:@"max"] integerValue];
        self.min = [[dicitonary objectForKey:@"min"] integerValue];
    }
    return self;
}

- (NSString *)rwetDescription {
    NSInteger averangeRwet = (self.max + self.min)/2;
    return [NSString stringWithFormat:@"Относительная влажность: %li %%", averangeRwet];
}

@end
