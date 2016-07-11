//
//  HENetworkingManager.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HENetworkingManager.h"
#import "ASIHTTPRequest.h"
#import "XMLReader.h"
#import "Reachability.h"

static NSString *const HEWeatherHostData = @"http://informer.gismeteo.ru/xml/34601_1.xml";
NSString *const HEConnectionFailureNotification = @"HEConnectionFailureNotification";

@implementation HENetworkingManager

- (NSDictionary *)getXMLDictionary {
    
    Reachability *reach = [Reachability reachabilityWithHostName:HEWeatherHostData];
    [reach startNotifier];
    
    if ([reach isReachable]) {
        
        NSURL *url = [NSURL URLWithString:HEWeatherHostData];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        
        [request startSynchronous];
        
        NSDictionary *xmlDictionary = [NSDictionary dictionary];
        NSError *error = [request error];
        if (!error) {
            
            NSString *response = [request responseString];
            
            NSError *parseError = nil;
            xmlDictionary = [XMLReader dictionaryForXMLString:response options:XMLReaderOptionsProcessNamespaces error:&parseError];
            
            //NSLog(@"%@", response);
            //NSLog(@"%@", xmlDictionary);
            
            return xmlDictionary;
            
        } else {
            //NSLog(@"%@", [error localizedDescription]);
        }
        
    } else {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:HEConnectionFailureNotification object:self];
        //NSLog(@"%@", [error localizedDescription]);
        
    }
    return nil;
}

@end
