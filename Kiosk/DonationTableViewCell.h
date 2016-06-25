//
//  DonationTableViewCell.h
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentListDataModels.h"
#import "ProjectDataModels.h"
@class MasjidAvailablePaymentType,ContentResourceresponse;
@interface DonationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *donationNameLabel;
- (void)configureDonationWithpaymentType:(PaymentListData *)paymentType;
- (void)configureProjectWithType:(ProjectData *)project;
@end
