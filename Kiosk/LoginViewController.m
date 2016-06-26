//
//  LoginViewController.m
//  Kiosk
//
//  Created by Arie on 6/25/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "LoginViewController.h"
#import "AuthDataModels.h"
#import "Configs.h"
#import <LCLoadingHUD/LCLoadingHUD.h>
#import "CustomFormTextField.h"
#import "NSString+Validation.h"
#import <TSMessages/TSMessage.h>
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet CustomFormTextField *userNameTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoading {
    [LCLoadingHUD showLoading:@"Loading" inView:self.view];
}
- (void)hideLoading {
    [LCLoadingHUD hideInView:self.view];
}
- (IBAction)loginButtonDidTapped:(id)sender {
    
    if (self.userNameTextField.text.length < 1) {
        self.userNameTextField.errorMessage = @"Cannot be empty";
        [self.userNameTextField showErrorBubble];
        return;
        
    }
    else if (self.passwordTextField.text.length < 1) {
        self.passwordTextField.errorMessage = @"Cannot be empty";
        [self.passwordTextField showErrorBubble];
        return;
    }
    [self showLoading];
    [AuthResponse userLogin:@{@"email":self.userNameTextField.text,@"password":self.passwordTextField.text} CompletionBlock:^(AuthResponse *response, NSError *error) {
        [self hideLoading];
        if ([response.status isEqualToString:API_STATUS_SUCCESS]) {
            [[NSUserDefaults standardUserDefaults] setObject:response.data.dataIdentifier forKey:PREFS_CREDENTIALS_USER_ID];
            [[NSUserDefaults standardUserDefaults] setObject:response.data.token forKey:PREFS_CREDENTIALS_USER_TOKEN];
            [[NSUserDefaults standardUserDefaults] setObject:response.data.firstName forKey:PREFS_CREDENTIALS_USER_NAME];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else {
            [self showNotificationWithTitle:@"Error" message:response.message isError:YES];
        }
    }];
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
