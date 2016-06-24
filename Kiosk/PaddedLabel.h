//
//  PaddedLabel.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//
#import <UIKit/UIKit.h>


//IB_DESIGNABLE
@interface PaddedLabel : UILabel

@property (assign, nonatomic) IBInspectable NSUInteger leftPadding;
@property (assign, nonatomic) IBInspectable NSUInteger rightPadding;
@property (assign, nonatomic) IBInspectable NSUInteger topPadding;
@property (assign, nonatomic) IBInspectable NSUInteger bottomPadding;

@end
