//
//  DonationListViewController.h
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "BaseViewController.h"
@class PaymentListData,ProjectData;
@protocol DonationListViewControllerDelegate <NSObject>

- (void)donationListViewControllerDonationSelected:(NSInteger)donationTypeSelected;

@end
@interface DonationListViewController : BaseViewController
@property (nonatomic, assign) NSInteger sortSelected;
@property (nonatomic, assign) BOOL isProject;
@property (nonatomic,strong) NSArray *response;
@property (nonatomic, weak) id<DonationListViewControllerDelegate> delegate;
@end
