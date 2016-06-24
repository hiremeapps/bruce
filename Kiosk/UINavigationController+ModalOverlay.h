//
//  UINavigationController+ModalOverlay.h
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ModalOverlay)
- (void)presentModalViewControllerOverlay:(UIViewController *)viewController;
- (void)presentModalViewControllerOverlay:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)())completion;
@end
