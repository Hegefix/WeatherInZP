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

@property (strong, nonatomic) IBOutlet UIImageView *weatherIconView;  //??? strong? weak?
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
    //self.weatherIconView = [[UIImageView alloc] init]; ???
    //self.weatherIconView.image = nil;                  ???
}

#pragma mark - Private - 

- (void)_initialSetup {
    [self.dateLabel setTextColor:[UIColor whiteColor]];
    [self.weatherLabel setTextColor:[UIColor whiteColor]];
    [self.todLabel setTextColor:[UIColor whiteColor]];
    
    //[self addSubview:self.weatherIconView]; ???
}

- (UIImage *)weatherIconWithForecast:(HEForecast *)forecast {
    
    if (forecast.phenomena.precipitation == 10 || forecast.phenomena.precipitation == 9) {
        //no precipitation
        switch (forecast.phenomena.cloudiness) {
            case 0:
                //ясно
                break;
                
            case 1:
                //малооблачно
                break;
            
            case 2:
                //облачно
                break;
                
            case 3:
                //пасмурно
                break;
                
            default:
                //error
                break;
        }
        
    } else {
        //precipitation
        switch (forecast.phenomena.precipitation) {
            case 4:
                //дождь
                break;
                
            case 5:
                //ливень
                break;
                
            case 6:
                //снег
                break;
                
            case 7:
                //снегопад
                break;
                
            case 8:
                //гроза
                break;
                
            default:
                //error
                break;
        }
        
    }
    return nil;
}

@end
