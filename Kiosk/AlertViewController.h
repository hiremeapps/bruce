#import <UIKit/UIKit.h>

@class AlertViewController;

@protocol AlertViewControllerDelegate <NSObject>

@optional
- (void)didSelectOKButtonAlertViewController:(AlertViewController *)alertViewVC;
- (void)didSelectCancelButtonAlertViewController:(AlertViewController *)alertViewVC;
- (void)didSelectCloseButtonAlertViewController:(AlertViewController *)alertViewVC;
- (void)didSelectOKButtonReauthenticationAlertViewController:(AlertViewController *)alertViewVC;
@end

@interface AlertViewController : UIViewController
@property (nonatomic, assign) BOOL isReauthenticationAlert;

@property (strong, nonatomic) NSString *titleAlertText;
@property (strong, nonatomic) NSString *descriptionAlertText;
@property (strong, nonatomic) NSAttributedString *attributedDescriptionAlertText;
@property (strong, nonatomic) NSString *okButtonText;
@property (strong, nonatomic) NSString *cancelButtonText;
@property (weak, nonatomic) id<AlertViewControllerDelegate>delegate;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id<AlertViewControllerDelegate>)delegate
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                okButtonTitle:(nullable NSString *)okButtonTitle;

- (instancetype)initWithTitle:(NSString *)title
            attributedMessage:(NSAttributedString *)attributedMessage
                     delegate:(id<AlertViewControllerDelegate>)delegate
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                okButtonTitle:(nullable NSString *)okButtonTitle;

@property (assign, nonatomic) BOOL closeButtonShown;

@end
