//
//  SeparatorLineView.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

//IB_DESIGNABLE
@interface SeparatorLineView : UIView

@property (assign, nonatomic) IBInspectable BOOL isVerticalLine;
@property (strong, nonatomic) IBInspectable UIColor *lineColor;
@property (assign, nonatomic) IBInspectable BOOL dashed;
@property (assign, nonatomic) IBInspectable CGFloat dashLength;
@property (assign, nonatomic) IBInspectable CGFloat spaceLength;
@property (assign, nonatomic) IBInspectable BOOL drawOnTop;

@end