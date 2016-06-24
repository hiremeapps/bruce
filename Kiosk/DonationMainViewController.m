//
//  DonationMainViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "DonationMainViewController.h"
#import "DonationViewController.h"
@interface DonationMainViewController ()

@end

@implementation DonationMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)donationDidTapped:(id)sender {
    DonationViewController *donationDetailVC = [[DonationViewController alloc] initWithNibName:@"DonationViewController" bundle:nil];
    [self.navigationController pushViewController:donationDetailVC animated:YES];
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
