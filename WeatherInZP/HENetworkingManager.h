//
//  HENetworkingManager.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const HEConnectionFailureNotification;

@interface HENetworkingManager : NSObject

- (NSDictionary *)getXMLDictionary;

@end
