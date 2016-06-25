//
//  DonationView.m
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "DonationView.h"
@interface DonationView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewBottomConstraint;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *darkBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@end
@implementation DonationView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.donationTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.darkBackgroundView.alpha = 0.0f;
    self.closeButton.layer.cornerRadius = 5.0f;
    self.closeButton.layer.borderWidth = 1.0f;
    self.closeButton.layer.borderColor = [self.closeButton titleColorForState:UIControlStateNormal].CGColor;
}

- (void)repositionContainerView {
    self.tableViewHeightConstraints.constant = self.donationTableView.contentSize.height;
    self.containerViewBottomConstraint.constant = -CGRectGetHeight(self.containerView.frame);
}

- (void)animateAppear {
    self.containerViewBottomConstraint.constant = 0;
    [UIView animateWithDuration:0.25f animations:^{
        self.darkBackgroundView.alpha = 1.0f;
        [self layoutIfNeeded];
    }];
}

- (void)animateDisappear:(void (^)())completion {
    self.containerViewBottomConstraint.constant = -CGRectGetHeight(self.containerView.frame);
    [UIView animateWithDuration:0.25f animations:^{
        self.darkBackgroundView.alpha = 0.0f;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}


@end
