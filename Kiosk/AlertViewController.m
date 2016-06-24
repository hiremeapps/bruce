#import "AlertViewController.h"

@interface AlertViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleAlertLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionAlertLabel;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIView *alertViewContainer;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation AlertViewController

- (instancetype)initWithTitle:(NSString *)title
            attributedMessage:(NSAttributedString *)attributedMessage
                     delegate:(id<AlertViewControllerDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
                okButtonTitle:(NSString *)okButtonTitle {
    self = [super initWithNibName:@"AlertViewController" bundle:nil];
    if (self) {
        _titleAlertText = title;
        _attributedDescriptionAlertText = attributedMessage;
        _okButtonText = okButtonTitle;
        _cancelButtonText = cancelButtonTitle;
        _delegate = delegate;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id<AlertViewControllerDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
                okButtonTitle:(NSString *)okButtonTitle {
    self = [super initWithNibName:@"AlertViewController" bundle:nil];
    if (self) {
        _titleAlertText = title;
        _descriptionAlertText = message;
        _okButtonText = okButtonTitle;
        _cancelButtonText = cancelButtonTitle;
        _delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleAlertLabel.text = self.titleAlertText;
    
    if (self.attributedDescriptionAlertText) {
        self.descriptionAlertLabel.attributedText = self.attributedDescriptionAlertText;
    }
    else {
        self.descriptionAlertLabel.text = self.descriptionAlertText;
    }
    
    if (self.okButtonText) {
        [self.okButton setTitle:self.okButtonText forState:UIControlStateNormal];
    } else {
        [self.okButton  removeFromSuperview];
    }
    
    if (self.cancelButtonText) {
        [self.cancelButton setTitle:self.cancelButtonText forState:UIControlStateNormal];
        self.closeButton.hidden = YES;
    }
    else {
        [self.cancelButton removeFromSuperview];
    }
    
    if (!self.closeButtonShown) {
        self.closeButton.hidden = YES;
    }
    
    CABasicAnimation *scale1 = [CABasicAnimation animation];
    scale1.keyPath = @"transform.scale";
    scale1.toValue = @0.95;
    scale1.fromValue = @1.05;
    scale1.duration = 0.1;
    scale1.beginTime = 0.0;
    
    CABasicAnimation *scale2 = [CABasicAnimation animation];
    scale2.keyPath = @"transform.scale";
    scale2.toValue = @1;
    scale2.fromValue = @0.95;
    scale2.duration = 0.09;
    scale2.beginTime = 0.1;
    
    CABasicAnimation *fadeIn = [CABasicAnimation animation];
    fadeIn.keyPath = @"opacity";
    fadeIn.toValue = @1.0;
    fadeIn.fromValue = @0.5;
    fadeIn.duration = 0.8;
    fadeIn.beginTime = 0.0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 0.19;
    animationGroup.animations = @[scale1, scale2, fadeIn];
    [self.alertViewContainer.layer addAnimation:animationGroup forKey:nil];
}

#pragma mark - UIButton action
- (IBAction)okButtonTapped:(id)sender {
    [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.alpha = 0;
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.isReauthenticationAlert) {
            if ([self.delegate respondsToSelector:@selector(didSelectOKButtonReauthenticationAlertViewController:)]) {
                [self.delegate didSelectOKButtonReauthenticationAlertViewController:self];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(didSelectOKButtonAlertViewController:)]) {
                [self.delegate didSelectOKButtonAlertViewController:self];
            }
        }
        self.presentingViewController.navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    });
}

- (IBAction)cancelButtonTapped:(UIButton *)sender {
    [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.alpha = 0;
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(didSelectCancelButtonAlertViewController:)]) {
            [self.delegate didSelectCancelButtonAlertViewController:self];
        }
        self.presentingViewController.navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    });
}

- (IBAction)closeButtonTapped:(UIButton *)sender {
    [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.alpha = 0;
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(didSelectCloseButtonAlertViewController:)]) {
            [self.delegate didSelectCloseButtonAlertViewController:self];
        }
        self.presentingViewController.navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    });
}

- (void)setCloseButtonShown:(BOOL)shown {
    _closeButtonShown = shown;
    self.closeButton.hidden = !shown;
}

@end
