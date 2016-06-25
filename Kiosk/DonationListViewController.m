//
//  DonationListViewController.m
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "DonationListViewController.h"
#import "DonationListDataSource.h"
#import "PaymentListDataModels.h"
#import "ProjectData.h"
#import "DonationView.h"
@interface DonationListViewController () <UITableViewDelegate>
@property (nonatomic,strong) DonationView *view;
@property (nonatomic,strong) DonationListDataSource *dataSource;
@end

@implementation DonationListViewController
@dynamic view;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DonationListDataSource alloc] init];
    self.view.donationTableView.delegate = self;
    self.view.donationTableView.dataSource = self.dataSource;
    self.dataSource.isProject = self.isProject;
    self.dataSource.data = self.response;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view repositionContainerView];
    [self.view animateAppear];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.sortSelected = indexPath.row;
    [self.view animateDisappear:^{
        [(UIViewController*)self.delegate dismissViewControllerAnimated:NO completion:^{
            if ([self.delegate respondsToSelector:@selector(donationListViewControllerDonationSelected:)]) {
                [self.delegate donationListViewControllerDonationSelected:self.sortSelected];
            }
        }];
    }];
}
- (IBAction)closeButtonDidTapped:(id)sender {
    [self.view animateDisappear:^{
        [(UIViewController*)self.delegate dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
