//
//  HEPhemomena.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEPhenomena : NSObject

@property (nonatomic) NSInteger cloudiness;
@property (nonatomic) NSInteger precipitation;
@property (nonatomic) NSInteger rpower;
@property (nonatomic) NSInteger spower;

- (instancetype)initWithDictionary:(NSDictionary *)dicitonary;
- (NSString *)cloudinessDescription;
- (NSString *)precipitationDescription;

@end
