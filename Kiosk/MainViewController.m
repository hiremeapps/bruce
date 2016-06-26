//
//  MainViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "DonationMainViewController.h"
#import "UIColor+Masjidpay.h"
#import "Configs.h"
#import <JFBCrypt/JFBCrypt.h>
#import "DashboardViewController.h"
#import "AuthDataModels.h"
#import "AuthDataModels.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MASJIDPAY KIOSK";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutButtonDidTapped:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Confirmation"
                                          message:@"Please fill your password"
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Username"; //for passwords
        textField.secureTextEntry = NO;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password"; //for passwords
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       [alertController dismissViewControllerAnimated:YES completion:nil];
                                   }];
    UIAlertAction *submitAction = [UIAlertAction
                                   actionWithTitle:@"Submit"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       [self confirmationDidtappedWithPassword:alertController.textFields[0].text password:alertController.textFields[1].text];
                                       [alertController dismissViewControllerAnimated:YES completion:nil];
                                       NSLog(@"Submit action");
                                   }];
    [alertController addAction:cancelAction];
    [alertController addAction:submitAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)confirmationDidtappedWithPassword:(NSString *)username password:(NSString *)password {
    if (username.length<1 || password.length<1) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"ERROR"
                                              message:@"Cannot be Empty"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *submitAction = [UIAlertAction
                                       actionWithTitle:@"Submit"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           [alertController dismissViewControllerAnimated:YES completion:nil];
                                           
                                       }];
        [alertController addAction:submitAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    [self showLoading];
    [AuthResponse userLogin:@{@"email":username,@"password":password} CompletionBlock:^(AuthResponse *response, NSError *error) {
        [self hideLoading];
        if ([response.status isEqualToString:API_STATUS_SUCCESS]) {
            [self doLogout];
        }
        else {
            [self showNotificationWithTitle:@"Error" message:response.message isError:YES];
        }
    }];
    
}
- (void)doLogout {
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:PREFS_CREDENTIALS_USER_TOKEN];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:PREFS_CREDENTIALS_USER_ID];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:PREFS_CREDENTIALS_USER_NAME];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:PREFS_CREDENTIALS_USER_EMAIL];
    [self showLogin];
}
- (IBAction)fullScreenDidtapped:(id)sender {
    DashboardViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"DashboardViewController"];
    [self.navigationController pushViewController:newView animated:YES];
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
