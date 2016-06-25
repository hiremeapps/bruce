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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
