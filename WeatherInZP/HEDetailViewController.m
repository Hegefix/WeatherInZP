//
//  HEDetailViewController.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEDetailViewController.h"
#import "NSDate+ForecastDate.h"

@interface HEDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeOfDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *rwetLabel;
@property (weak, nonatomic) IBOutlet UILabel *comfortLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconView;

@end

@implementation HEDetailViewController

#pragma mark - Life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initialSetup];
    
    NSString *date = [NSString stringWithFormat:@"%@, %@", [NSDate formatDateWithDate:self.forecast.date], [self.forecast weekDayDescription]];
    self.dateLabel.text = date;
    self.timeOfDayLabel.text = [self.forecast timeOfDayDescription];
    NSString *temperature = [self.forecast.temperature temperatureDescription];
    NSString *cloudines = [self.forecast.phenomena cloudinessDescription];
    NSString *precipitation = [self.forecast.phenomena precipitationDescription];
    self.weatherLabel.text = [NSString stringWithFormat:@"%@ %@, %@", temperature, cloudines, precipitation];
    self.pressureLabel.text = [self.forecast.pressure pressureDescription];
    self.windLabel.text = [self.forecast.wind windDescription];
    self.rwetLabel.text = [self.forecast.rwet rwetDescription];
    self.comfortLabel.text = [self.forecast.heat heatDescription];
}

#pragma mark - Private -

- (void)_initialSetup {
    self.backgroundImageView.image = [UIImage imageNamed:@"background"];
    [self.dateLabel setTextColor:[UIColor whiteColor]];
    [self.timeOfDayLabel setTextColor:[UIColor whiteColor]];
    [self.weatherLabel setTextColor:[UIColor whiteColor]];
    [self.pressureLabel setTextColor:[UIColor whiteColor]];
    [self.windLabel setTextColor:[UIColor whiteColor]];
    [self.rwetLabel setTextColor:[UIColor whiteColor]];
    [self.comfortLabel setTextColor:[UIColor whiteColor]];
    self.weatherIconView.image = [self _weatherIconWithForecast:self.forecast];
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
