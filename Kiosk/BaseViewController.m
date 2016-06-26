//
//  BaseViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "Configs.h"
#import "AuthDataModels.h"
#import <TSMessages/TSMessage.h>
#import <LCLoadingHUD/LCLoadingHUD.h>
#import "UIColor+Masjidpay.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self showLogin];
}
- (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message isError:(BOOL)isError {
    // Add a button inside the message
    [TSMessage showNotificationInViewController:self
                                          title:title
                                       subtitle:message
                                          image:nil
                                           type:isError?TSMessageNotificationTypeError:TSMessageNotificationTypeSuccess
                                       duration:TSMessageNotificationDurationAutomatic
                                       callback:nil
                                    buttonTitle:@"OK"
                                 buttonCallback:^{
                                 }
                                     atPosition:TSMessageNotificationPositionTop
                           canBeDismissedByUser:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)showLoading {
    [LCLoadingHUD showLoading:@"Loading" inView:self.view];
}
- (void)hideLoading {
    [LCLoadingHUD hideInView:self.view];
}
- (void)showLogin {
    if (![AuthResponse userIsLoggedIn]) {
        LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
