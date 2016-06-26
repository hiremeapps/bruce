//
//  BaseViewController.h
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)showLogin;
- (void)showLoading;
- (void)hideLoading;
- (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message isError:(BOOL)isError;
@end
