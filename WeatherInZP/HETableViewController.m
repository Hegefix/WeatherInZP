//
//  HETableViewController.m
//  WeatherInZP
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HETableViewController.h"
#import "HENetworkingManager.h"
#import "HEWeatherTableViewCell.h"
#import "HEDetailViewController.h"
#import "UIViewController+UIAlert.h"

@interface HETableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) HETown *town;

@end

@implementation HETableViewController

#pragma mark - Life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initialSetup];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Actions -

- (IBAction)refreshDidClick:(id)sender {
    
    HENetworkingManager *networkingManager = [[HENetworkingManager alloc] init];
    NSDictionary *xmlDictionary = [networkingManager getXMLDictionary];
    NSDictionary *forecastInfo = [[[xmlDictionary objectForKey:@"MMWEATHER"] objectForKey:@"REPORT"] objectForKey:@"TOWN"];
    
    self.town = [[HETown alloc] initWithDictionary:forecastInfo];
    [self.tableView reloadData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.title = self.town.name;
}

#pragma mark - Notifications -

- (void)receiveConectionFailureNote:(NSNotification *)notification {
    if ([notification.name isEqualToString:HEConnectionFailureNotification]) {
        [self showAlertWithText:@"Отсутсвует интернет подключение"];
    }
}

#pragma mark - <UITableViewDataSource> -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.town.forecasts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HEWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HEWeatherTableViewCell class])];
    HEForecast *forecast = [self.town.forecasts objectAtIndex:indexPath.row];
    [cell loadWithForecast:forecast];
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

#pragma mark - <UITableViewDelegate> -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HEForecast *forecast = [self.town.forecasts objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HEDetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([HEDetailViewController class])];
    detailViewController.forecast = forecast;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - Private -

- (void)_initialSetup {
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([HEWeatherTableViewCell class]) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass([HEWeatherTableViewCell class])];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.title = @"Нет данных";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [backgroundImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = backgroundImageView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveConectionFailureNote:)
                                                 name:HEConnectionFailureNotification object:nil];
}

@end
