//
//  UINavigationController+ModalOverlay.m
//  Masjid Pay
//
//  Created by Arie on 3/14/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "UINavigationController+ModalOverlay.h"

@implementation UINavigationController (ModalOverlay)

- (void)presentModalViewControllerOverlay:(UIViewController *)viewController {
    [self presentModalViewControllerOverlay:viewController animated:NO completion:nil];
}

- (void)presentModalViewControllerOverlay:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)())completion {
    self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.navigationController.providesPresentationContextTransitionStyle = YES;
    self.navigationController.definesPresentationContext = YES;
    viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:viewController animated:animated completion:completion];
}

@end
