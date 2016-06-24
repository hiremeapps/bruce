
#import "UIViewController+ModalOverlay.h"

@implementation UIViewController (ModalOverlay)

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
