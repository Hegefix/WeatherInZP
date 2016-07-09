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

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeOfDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *rwetLabel;
@property (weak, nonatomic) IBOutlet UILabel *comfortLabel;

@end

@implementation HEDetailViewController

#pragma mark - Life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initialSetup];
    
    [self _setBackgroundImageViewWithForecast:self.forecast];
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
    [self.dateLabel setTextColor:[UIColor whiteColor]];
    [self.timeOfDayLabel setTextColor:[UIColor whiteColor]];
    [self.weatherLabel setTextColor:[UIColor whiteColor]];
    [self.pressureLabel setTextColor:[UIColor whiteColor]];
    [self.windLabel setTextColor:[UIColor whiteColor]];
    [self.rwetLabel setTextColor:[UIColor whiteColor]];
    [self.comfortLabel setTextColor:[UIColor whiteColor]];
}

- (void)_setBackgroundImageViewWithForecast:(HEForecast *)forecast {
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

@end
