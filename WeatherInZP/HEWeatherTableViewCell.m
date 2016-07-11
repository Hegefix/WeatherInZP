//
//  HEWeatherTableViewCell.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEWeatherTableViewCell.h"
#import "NSDate+ForecastDate.h"

@interface HEWeatherTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *todLabel;

@end

@implementation HEWeatherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _initialSetup];
}

- (void)loadWithForecast:(HEForecast *)forecast {
    
    self.dateLabel.text = [NSDate formatDateWithDate:forecast.date];
    NSString *temperature = [forecast.temperature averangeTemperatureDescription];
    NSString *cloudines = [forecast.phenomena cloudinessDescription];
    NSString *precipitation = [forecast.phenomena precipitationDescription];
    self.weatherLabel.text = [NSString stringWithFormat:@"%@ %@, %@", temperature, cloudines, precipitation];
    self.todLabel.text = [forecast timeOfDayDescription];
    self.weatherIconView.image = [self _weatherIconWithForecast:forecast];
}

#pragma mark - Private - 

- (void)_initialSetup {
    [self.dateLabel setTextColor:[UIColor whiteColor]];
    [self.weatherLabel setTextColor:[UIColor whiteColor]];
    [self.todLabel setTextColor:[UIColor whiteColor]];
}

- (UIImage *)_weatherIconWithForecast:(HEForecast *)forecast {
    
    if (forecast.phenomena.precipitation == 10 || forecast.phenomena.precipitation == 9) {
        
        //no precipitation
        switch (forecast.phenomena.cloudiness) {
            case 0:
                return [UIImage imageNamed:(forecast.tod == 0)?(@"half-moon-icon"):(@"sunny-icon")];
                break;
                
            case 1:
                return [UIImage imageNamed:(forecast.tod == 0)?(@"night-cloud-icon"):(@"sunshine-cloud")];
                break;
            
            case 2:
                return [UIImage imageNamed:@"partially-cloud-icon"];
                break;
                
            case 3:
                return [UIImage imageNamed:@"full-cloud-icon"];
                break;
                
            default:
                return nil;
                break;
        }
        
    } else {
        
        //precipitation
        switch (forecast.phenomena.precipitation) {
            case 4:
                return [UIImage imageNamed:@"raining-icon"];
                break;
                
            case 5:
                return [UIImage imageNamed:@"mostly-raining-icon"];
                break;
                
            case 6:
                return [UIImage imageNamed:@"snow-icon"];
                break;
                
            case 7:
                return [UIImage imageNamed:@"snow-icon"];
                break;
                
            case 8:
                return [UIImage imageNamed:@"thunderstorm-icon"];
                break;
                
            default:
                return nil;
                break;
        }
    }
    return nil;
}

@end
