//
//  DashboardViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "DashboardViewController.h"
#import "Configs.h"
@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dashboard";
    
    NSString *dasboardUri = [NSString stringWithFormat:@"%@/kiosk/dashboard/%@",BASE_PAYMENT_URL,[[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_ID]];
    NSURL *url = [NSURL URLWithString:dasboardUri];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
