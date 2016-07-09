//
//  HETown.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HEForecast.h"

@interface HETown : NSObject

@property (strong, nonatomic) NSArray <HEForecast *> *forecasts;
@property (nonatomic) NSInteger index;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
