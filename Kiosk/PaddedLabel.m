//
//  PaddedLabel.m
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "PaddedLabel.h"

@implementation PaddedLabel

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _leftPadding = 15.0f;
        _rightPadding = 15.0f;
        _topPadding = 0.0f;
        _bottomPadding = 0.0f;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(self.topPadding, self.leftPadding, self.bottomPadding, self.rightPadding))];
}

- (void)setLeftPadding:(NSUInteger)leftPadding {
    _leftPadding = leftPadding;
    [self setNeedsDisplay];
}

- (void)setRightPadding:(NSUInteger)rightPadding {
    _rightPadding = rightPadding;
    [self setNeedsDisplay];
}

- (void)setTopPadding:(NSUInteger)topPadding {
    _topPadding = topPadding;
    [self setNeedsDisplay];
}

- (void)setBottomPadding:(NSUInteger)bottomPadding {
    _bottomPadding = bottomPadding;
    [self setNeedsDisplay];
}

@end
