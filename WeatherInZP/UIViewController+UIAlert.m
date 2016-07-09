//
//  UIViewController+UIAlert.m
//  WeatherInZP
//
//  Created by Виктор on 09.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "UIViewController+UIAlert.h"

@implementation UIViewController (UIAlert)

- (void)showAlertWithText:(NSString *)string {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:string message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
