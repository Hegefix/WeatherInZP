//
//  HEWeatherTableViewCell.h
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEWeatherTableViewCell : UITableViewCell

- (void)loadWithForecast:(HEForecast *)forecast;

@end
