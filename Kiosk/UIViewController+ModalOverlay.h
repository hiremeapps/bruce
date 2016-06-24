
#import <UIKit/UIKit.h>

@interface UIViewController (ModalOverlay)

- (void)presentModalViewControllerOverlay:(UIViewController *)viewController;
- (void)presentModalViewControllerOverlay:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)())completion;

@end
