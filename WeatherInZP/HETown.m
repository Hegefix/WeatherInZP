//
//  HETown.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HETown.h"


@implementation HETown

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self != nil) {
        self.forecasts = [self _forecastsFromArray:[dictionary objectForKey:@"FORECAST"]];
        self.index = [[dictionary objectForKey:@"index"] integerValue];
        
        NSString *stringURL = [dictionary objectForKey:@"sname"];
        NSString *town = [stringURL stringByReplacingPercentEscapesUsingEncoding:NSWindowsCP1251StringEncoding];
        self.name = town;
        
        self.latitude = [[dictionary objectForKey:@"latitude"] floatValue];
        self.longitude = [[dictionary objectForKey:@"longitude"] floatValue];
    }
    return self;
}

#pragma mark - Private -

- (NSArray <HEForecast *> *)_forecastsFromArray:(NSArray *)array {
    
    NSMutableArray *result = [NSMutableArray array];
    if ([array isKindOfClass:[NSArray class]]) {
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HEForecast *forecast = [[HEForecast alloc] initWithDictionary:obj];
            [result addObject:forecast];
        }];
        return [NSArray arrayWithArray:result];
    }
    return [NSArray array];
}

@end
