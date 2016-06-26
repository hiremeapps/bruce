//
//  DashboardViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "DashboardViewController.h"
#import "Configs.h"
#import "AuthDataModels.h"
@interface DashboardViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dashboard";
    if (![AuthResponse userIsLoggedIn]) {
        return;
    }
    NSString *dasboardUri = [NSString stringWithFormat:@"%@/kiosk/dashboard/%@",BASE_PAYMENT_URL,[[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_ID]];
    NSURL *url = [NSURL URLWithString:dasboardUri];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    self.webview.delegate = self; // Here is the key
    [self.webview loadRequest:requestObj];
    
    // Do any additional setup after loading the view.
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self showLoading];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self hideLoading];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self hideLoading];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
