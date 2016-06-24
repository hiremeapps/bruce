//
//  CustomFormTextField.m
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "CustomFormTextField.h"
#import "PaddedLabel.h"
#import "Configs.h"
@interface CustomFormTextField()

@property (strong, nonatomic) NSAttributedString *floatingPlaceholder;
@property (strong, nonatomic) UILabel *floatingPlaceholderLabel;
@property (strong, nonatomic) UIButton *errorButton;
@property (strong, nonatomic) UIImageView *errorArrow;
@property (strong, nonatomic) PaddedLabel *errorMessageLabel;
@property (assign, nonatomic) BOOL startedEditing;
@end

@implementation CustomFormTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.floatingPlaceholder = self.attributedPlaceholder;
        [self initializeComponents];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initializeComponents];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeComponents];
    }
    return self;
}

- (void)initializeComponents {
    
    _floatingPlaceholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _floatingPlaceholderLabel.font = self.font;
    _floatingPlaceholderLabel.attributedText = self.floatingPlaceholder;
    _floatingPlaceholderLabel.backgroundColor = [UIColor clearColor];
    _floatingPlaceholderLabel.textColor = self.textColor;
    [self addSubview:_floatingPlaceholderLabel];
    
    _errorButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 17, (self.frame.size.height - 17) /2.0f, 17, 17)];
    [_errorButton setImage:[UIImage imageNamed:@"icon-error"] forState:UIControlStateNormal];
    [_errorButton addTarget:self action:@selector(errorButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    _errorButton.hidden = YES;
    [self addSubview:_errorButton];
    
    _errorArrow = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 14, self.frame.size.height - 9.0f, 7.0f, 6.0f)];
    _errorArrow.image = [UIImage imageNamed:@"arrow-error"];
    _errorArrow.hidden = YES;
    [self addSubview:_errorArrow];
    
    _errorMessageLabel = [[PaddedLabel alloc] initWithFrame:CGRectMake(-10, CGRectGetMaxY(_errorArrow.frame), self.frame.size.width + 20, 29.0f)];
    _errorMessageLabel.hidden = YES;
    _errorMessageLabel.clipsToBounds = YES;
    _errorMessageLabel.layer.cornerRadius = 5.0f;
    _errorMessageLabel.backgroundColor = [UIColor colorWithRed:0.86667f green:0.0f blue:0.0f alpha:1.0f];
    _errorMessageLabel.textColor = [UIColor whiteColor];
    _errorMessageLabel.font = [UIFont fontWithName:FONT_NAME_MEDIUM size:14.0f];
    _errorMessageLabel.numberOfLines = 0;
    [self addSubview:_errorMessageLabel];
    
    self.clipsToBounds = NO;
    
    [self addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self action:@selector(startEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self textChange:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.errorButton.frame = CGRectMake(self.frame.size.width - 17, (self.frame.size.height - 17) /2.0f, 17, 17);
    self.errorArrow.frame = CGRectMake(self.frame.size.width - 14, self.frame.size.height - 9.0f, 7.0f, 6.0f);
    self.errorMessageLabel.frame = CGRectMake(-10, CGRectGetMaxY(_errorArrow.frame), self.frame.size.width + 20, 29.0f);
    [self textChange:nil];
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    //do nothing
}

- (void)drawRect:(CGRect)rect {
    if (!self.noBottomLine) {
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        [[UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.00] set];
        CGContextSetLineWidth(currentContext,1.0f/[UIScreen mainScreen].scale);
        CGContextMoveToPoint(currentContext,0.0f, rect.size.height);
        CGContextAddLineToPoint(currentContext,rect.size.width, rect.size.height);
        CGContextStrokePath(currentContext);
    }
    [super drawRect:rect];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    if ([self.text isEqualToString:@""])
    return bounds;
    return CGRectMake(bounds.origin.x, bounds.origin.y + 0.2 * self.frame.size.height, bounds.size.width - 20.0f, bounds.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x, bounds.origin.y + 0.2 * self.frame.size.height, bounds.size.width - 20.0f, bounds.size.height);
}

- (void)setPlaceholder:(NSString *)placeholder {
    super.placeholder = placeholder;
    self.floatingPlaceholder = [[NSAttributedString alloc] initWithString:placeholder];
    self.floatingPlaceholderLabel.attributedText = self.floatingPlaceholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    super.attributedPlaceholder = attributedPlaceholder;
    self.floatingPlaceholder = attributedPlaceholder;
    self.floatingPlaceholderLabel.attributedText = attributedPlaceholder;
}

- (void)textChange:(id)sender {
    if (self.isEditing && !self.startedEditing) {
        self.errorMessage = @"";
    }
    self.startedEditing = NO;
    if ([self.text isEqualToString:@""]) {
        [UIView animateWithDuration:0.25f animations:^{
            self.floatingPlaceholderLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            self.floatingPlaceholderLabel.font = self.font;
        }];
    }
    else {
        [UIView animateWithDuration:0.25f animations:^{
            if (self.floatingFontSize > 0) {
                self.floatingPlaceholderLabel.font = [self.font fontWithSize:self.floatingFontSize];
                self.floatingPlaceholderLabel.adjustsFontSizeToFitWidth = YES;
            }
            else {
                self.floatingPlaceholderLabel.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize*0.85];
            }
            [self.floatingPlaceholderLabel sizeToFit];
            self.floatingPlaceholderLabel.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), CGRectGetHeight(self.floatingPlaceholderLabel.frame));
        }];
    }
}

- (void)setErrorMessage:(NSString *)errorMessage {
    _errorMessage = errorMessage;
    self.errorMessageLabel.text = errorMessage;
    if ([errorMessage isEqualToString:@""]) {
        self.errorButton.hidden = YES;
        self.errorMessageLabel.hidden = YES;
        self.errorArrow.hidden = YES;
    }
    else {
        self.errorButton.hidden = NO;
    }
}

- (void)errorButtonTapped:(id)sender {
    self.errorArrow.hidden = !self.errorArrow.hidden;
    self.errorMessageLabel.hidden = self.errorArrow.hidden;
}

- (void)showErrorBubble {
    [self setErrorShown:YES];
}

- (void)setErrorShown:(BOOL)errorShown {
    _errorShown = errorShown;
    self.errorMessageLabel.hidden = self.errorArrow.hidden = !errorShown;
}

- (void)startEditing {
    self.startedEditing = YES;
    if (![self.errorMessage isEqualToString:@""] && self.errorMessage)
    self.errorMessageLabel.hidden = self.errorArrow.hidden = NO;
}

- (void)editingDidEnd {
    self.errorMessageLabel.hidden = self.errorArrow.hidden = YES;
}

- (void)setText:(NSString *)text {
    if ([self.text isEqualToString:text]) {
        [self startEditing];
    } else {
        [super setText:text];
        [self textChange:nil];
    }
}

- (void)setPlaceholderLabelColor:(UIColor *)placeholderLabelColor {
    self.floatingPlaceholderLabel.textColor = placeholderLabelColor;
}
- (void)showBottomLine:(CustomFormTextField *)textField {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [[UIColor colorWithRed:0.45 green:0.45 blue:0.45 alpha:1.00] set];
    CGContextSetLineWidth(currentContext,1.0f/[UIScreen mainScreen].scale);
    CGContextMoveToPoint(currentContext,0.0f, textField.frame.size.height);
    CGContextAddLineToPoint(currentContext,textField.frame.size.width, textField.frame.size.height);
    CGContextStrokePath(currentContext);
    [textField drawRect:textField.frame];
}
@end

