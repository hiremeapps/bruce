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
#import "CustomFormTextField.h"
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
- (IBAction)loginButtonDidTapped:(id)sender {
    [AuthResponse userLogin:@{@"email":self.userNameTextField.text,@"password":self.passwordTextField.text} CompletionBlock:^(AuthResponse *response, NSError *error) {
        NSLog(@"data-->%@",response);
        if ([response.status isEqualToString:API_STATUS_SUCCESS]) {
            [[NSUserDefaults standardUserDefaults] setObject:response.data.dataIdentifier forKey:PREFS_CREDENTIALS_USER_ID];
            [[NSUserDefaults standardUserDefaults] setObject:response.data.token forKey:PREFS_CREDENTIALS_USER_TOKEN];
            [[NSUserDefaults standardUserDefaults] setObject:response.data.firstName forKey:PREFS_CREDENTIALS_USER_NAME];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
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
