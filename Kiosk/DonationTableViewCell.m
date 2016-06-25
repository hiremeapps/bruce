//
//  DonationTableViewCell.m
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "DonationTableViewCell.h"

@implementation DonationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)configureDonationWithpaymentType:(PaymentListData *)paymentType {
    self.donationNameLabel.text = paymentType.name;
}

- (void)configureProjectWithType:(ProjectData *)project {
    self.donationNameLabel.text = project.postMeta.title;
}
@end
