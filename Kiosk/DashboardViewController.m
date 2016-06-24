//
//  DashboardViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"https://app.masjidpay.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
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
