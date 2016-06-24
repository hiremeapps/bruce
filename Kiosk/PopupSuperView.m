#import "PopUpSuperView.h"

@implementation PopUpSuperView

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    NSDictionary *bindings = @{@"currentView" : self};
    self.translatesAutoresizingMaskIntoConstraints = NO;
    if (self.superview) {
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[currentView]|" options:0 metrics:nil views:bindings]];
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[currentView]|" options:0 metrics:nil views:bindings]];
    }
}

@end
