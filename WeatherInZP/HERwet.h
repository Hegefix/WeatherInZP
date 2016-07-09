//
//  HERelwet.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HERwet : NSObject

@property (nonatomic) NSInteger max;
@property (nonatomic) NSInteger min;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)rwetDescription;

@end
