//
//  CustomFormTextField.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

//IB_DESIGNABLE

@interface CustomFormTextField : UITextField

@property (strong, nonatomic) NSString *errorMessage;
@property (assign, nonatomic) BOOL errorShown;
@property (assign, nonatomic) IBInspectable BOOL noBottomLine;
@property (assign, nonatomic) IBInspectable NSInteger floatingFontSize;
@property (assign, nonatomic) IBInspectable UIColor *placeholderLabelColor;

- (void)showErrorBubble;
- (void)showBottomLine:(CustomFormTextField *)textField;

@end

