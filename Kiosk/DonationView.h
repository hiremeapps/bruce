//
//  DonationView.h
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonationView : UIView
@property (weak, nonatomic) IBOutlet UITableView *donationTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraints;
- (void)repositionContainerView;
- (void)animateAppear;
- (void)animateDisappear:(void(^)())completion;
@end
