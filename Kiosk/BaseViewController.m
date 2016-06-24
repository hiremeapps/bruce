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
#import "UIColor+Masjidpay.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Change navigation bar appearance
    [[UINavigationBar appearance] setBarTintColor:[UIColor mp_greenColor]];
    
    // to remove 1 px border below nav bar
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
    //   / [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                          NSFontAttributeName : [UIFont fontWithName:FONT_NAME_BOLD
                                                                                size:17.0f]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    
    // LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    //[self.navigationController presentViewController:loginVC animated:YES completion:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
