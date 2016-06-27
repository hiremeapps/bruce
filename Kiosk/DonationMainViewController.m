//
//  DonationMainViewController.m
//  Kiosk
//
//  Created by Arie on 6/24/16.
//  Copyright © 2016 Arie. All rights reserved.
//

#import "DonationMainViewController.h"
#import "DonationViewController.h"
#import "ProjectDataModels.h"
#import "PaymentListDataModels.h"
#import "Configs.h"
#import "CustomFormTextField.h"
#import "Util.h"
#import "AuthDataModels.h"
#import "UINavigationController+ModalOverlay.h"
#import "UIColor+Masjidpay.h"
#import "ProjectResponse.h"
#import "NSString+Validation.h"
#import "DonationListViewController.h"
@interface DonationMainViewController ()<UITextFieldDelegate,DonationListViewControllerDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm1;
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm2;
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm3;
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm4;
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm5;
@property (weak, nonatomic) IBOutlet UIButton *donateButtonTerm6;
@property (weak, nonatomic) IBOutlet UIButton *donateButton;
@property (weak, nonatomic) IBOutlet UITextView *agreeTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *donationTextFieldHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightAgreeTextViewLayoutConstraint;
@property (nonatomic, strong) NSArray *donationTemplate;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSArray *project;
@property (weak, nonatomic) IBOutlet CustomFormTextField *amountTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *paymentSelectionTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *projectSelectionTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *remarkTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *nameTextField;
@property (weak, nonatomic) IBOutlet CustomFormTextField *emailTextField;
@property (nonatomic) NSInteger lastStateTextField;
@property (nonatomic) NSInteger lastSelectedButton;
@property (nonatomic, strong) NSArray *response;
@property (nonatomic, strong) NSArray *projectData;
@property (nonatomic, strong) PaymentListData *paymentType;
@property (nonatomic, strong) ProjectData *projectType;
@end

@implementation DonationMainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.donationTextFieldHeight.constant = 0.0f;
    self.navigationController.navigationBarHidden = NO;
    self.submerchantNameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_NAME];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastStateTextField = 0;
    self.donationTemplate = @[@"25",@"50",@"100",@"250",@"500",@"1000"];
    NSMutableAttributedString *tncAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Terms of Service", nil)];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.agreeTextView.attributedText];
    
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"tnc://"
                             range:[attributedString.string rangeOfString:tncAttributedString.string]];
    
    NSMutableAttributedString *privacyAttributedString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Privacy Policy", nil)];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"privacy://"
                             range:[attributedString.string rangeOfString:privacyAttributedString.string]];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:FONT_NAME_DEFAULT size:14.0f] range:NSMakeRange(0, attributedString.length)];
    self.agreeTextView.attributedText = attributedString;
    self.agreeTextView.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor mp_greenColor]};
    self.agreeTextView.delegate = self;
    [self.agreeTextView sizeThatFits:CGSizeMake(CGRectGetWidth(self.agreeTextView.frame), FLT_MAX)];
    self.heightAgreeTextViewLayoutConstraint.constant = CGRectGetHeight(self.agreeTextView.frame);
    
    if (![AuthResponse userIsLoggedIn]) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showLoading];
        [PaymentListResponse paymentList:@{@"token":[[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_TOKEN]} CompletionBlock:^(PaymentListResponse *response, NSError *error) {
            [self hideLoading];
            if (!error) {
                self.response = response.data;
            }
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showLoading];
        [ProjectResponse projectList:@{@"token":[[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_TOKEN]} CompletionBlock:^(ProjectResponse *response, NSError *error) {
            [self hideLoading];
            if (!error) {
                self.project = response.data;
            }
        }];
    });
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.donateButtonTerm1.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm1.layer.cornerRadius = 3.0f;
    self.donateButtonTerm1.layer.borderWidth = 2.0f;
    self.donateButtonTerm1.layer.masksToBounds = YES;
    self.donateButtonTerm1.tag = 0;
    [self.donateButtonTerm1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm1 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm1 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    self.donateButtonTerm2.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm2.layer.cornerRadius = 3.0f;
    self.donateButtonTerm2.layer.borderWidth = 2.0f;
    self.donateButtonTerm2.layer.masksToBounds = YES;
    self.donateButtonTerm2.tag = 1;
    [self.donateButtonTerm2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm2 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm2 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    self.donateButtonTerm3.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm3.layer.cornerRadius = 3.0f;
    self.donateButtonTerm3.layer.borderWidth = 2.0f;
    self.donateButtonTerm3.layer.masksToBounds = YES;
    self.donateButtonTerm3.tag = 2;
    [self.donateButtonTerm3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm3 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm3 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    self.donateButtonTerm4.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm4.layer.cornerRadius = 3.0f;
    self.donateButtonTerm4.layer.borderWidth = 2.0f;
    self.donateButtonTerm4.layer.masksToBounds = YES;
    self.donateButtonTerm4.tag = 3;
    [self.donateButtonTerm4 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm4 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm4 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    
    self.donateButtonTerm5.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm5.layer.cornerRadius = 3.0f;
    self.donateButtonTerm5.layer.borderWidth = 2.0f;
    self.donateButtonTerm5.layer.masksToBounds = YES;
    self.donateButtonTerm5.tag = 4;
    [self.donateButtonTerm5 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm5 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm5 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm5 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    self.donateButtonTerm6.layer.borderColor = [UIColor mp_greenColor].CGColor;
    self.donateButtonTerm6.layer.cornerRadius = 3.0f;
    self.donateButtonTerm6.layer.borderWidth = 2.0f;
    self.donateButtonTerm6.layer.masksToBounds = YES;
    self.donateButtonTerm6.tag = 5;
    [self.donateButtonTerm6 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.donateButtonTerm6 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.donateButtonTerm6 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateHighlighted];
    [self.donateButtonTerm6 setBackgroundImage:[UIImage imageNamed:@"primary_button"] forState:UIControlStateSelected];
    
    self.donateButton.layer.cornerRadius = 3.0f;
    self.donateButton.layer.masksToBounds = YES;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)donationDidTapped:(UIButton *)sender {
    [self clearAllState];
    sender.selected = !sender.selected;
    self.amount = [self.donationTemplate objectAtIndex:[sender tag]];
    self.amountTextField.text = [Util formattedCurrencyWithCurrencySign:@"$" value:[[self.donationTemplate objectAtIndex:[sender tag]] integerValue] numDecimalPoint:0 showSign:YES];
}
- (IBAction)donationTemplateDidTapped:(UIButton *)sender {
    [self clearAllState];
    sender.selected = !sender.selected;
    self.amount = [self.donationTemplate objectAtIndex:[sender tag]];
    self.amountTextField.text = [Util formattedCurrencyWithCurrencySign:@"$" value:[[self.donationTemplate objectAtIndex:[sender tag]] integerValue] numDecimalPoint:0 showSign:YES];
}
- (void)donationListViewControllerDonationSelected:(NSInteger)donationTypeSelected {
    [self.view endEditing:YES];
    if (self.lastStateTextField == 2) {
        self.paymentType = self.response[donationTypeSelected];
        self.paymentSelectionTextField.text = self.paymentType.name;
        if ([self.paymentType.name isEqualToString:@"Project"]) {
            self.donationTextFieldHeight.constant = 45;
            self.projectSelectionTextField.hidden = NO;
            self.projectSelectionTextField.noBottomLine = false;
            [self.projectSelectionTextField updateConstraintsIfNeeded];
        }
        else {
            self.projectSelectionTextField.hidden = YES;
            self.projectSelectionTextField.errorShown = NO;
            self.projectSelectionTextField.errorMessage = @"";
            self.donationTextFieldHeight.constant = 0;
        }
        
        if([self.paymentType.name isEqualToString:@"Membership"]) {
            [self.donateButton setTitle:@"PAY NOW" forState:UIControlStateNormal];
        }
        else {
            [self.donateButton setTitle:@"DONATE NOW" forState:UIControlStateNormal];
        }
    }
    else {
        self.projectSelectionTextField.errorShown = NO;
        self.projectSelectionTextField.errorMessage = @"";
        self.projectType = self.project[donationTypeSelected];
        self.projectSelectionTextField.text = self.projectType.postMeta.title;
        
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.amountTextField) {
        self.amount = textField.text;
        if ([self validAmount]) {
            self.amountTextField.text = [Util formattedCurrencyWithCurrencySign:@"$" value:[self.amount integerValue] numDecimalPoint:0 showSign:YES];
        }
    }
    else if (textField == self.projectSelectionTextField) {
        if(self.projectSelectionTextField.text.isEmpty) {
            self.projectSelectionTextField.errorMessage = @"Cannot be empty";
            [self.projectSelectionTextField showErrorBubble];
        }
        else {
            self.projectSelectionTextField.errorShown = false;
            self.projectSelectionTextField.errorMessage = @"";
        }
    }
}
- (IBAction)projectTextFieldDidTapped:(id)sender {
    [self.view endEditing:YES];
    [self.amountTextField resignFirstResponder];
    [self.paymentSelectionTextField resignFirstResponder];
    [self.projectSelectionTextField resignFirstResponder];
    [self.remarkTextField resignFirstResponder];
    DonationListViewController *donationList = [[DonationListViewController alloc]initWithNibName:@"DonationListViewController" bundle:[NSBundle mainBundle]];
    self.lastStateTextField = 3;
    donationList.delegate = self;
    self.lastStateTextField = [sender tag];
    donationList.response = self.project;
    donationList.isProject = YES;
    [self.navigationController presentModalViewControllerOverlay:donationList];
}

- (IBAction)paymentTextFieldDidTapped:(id)sender {
    
    [self.view endEditing:YES];
    
    [self.amountTextField resignFirstResponder];
    [self.paymentSelectionTextField resignFirstResponder];
    [self.projectSelectionTextField resignFirstResponder];
    [self.remarkTextField resignFirstResponder];
    self.lastStateTextField = 2;
    DonationListViewController *donationList = [[DonationListViewController alloc]initWithNibName:@"DonationListViewController" bundle:[NSBundle mainBundle]];
    donationList.delegate = self;
    self.lastStateTextField = [sender tag];
    donationList.response = self.response;
    [self.navigationController presentModalViewControllerOverlay:donationList];
}

- (BOOL)validAmount {
    NSString *cleanAmount = [[self.amount stringByReplacingOccurrencesOfString:@"$ "
                                                                    withString:@""] stringByReplacingOccurrencesOfString:@"," withString:@""];
    self.amount = cleanAmount;
    self.amountTextField.errorMessage = @"";
    
    if (![Util validateAllNumber:cleanAmount]) {
        self.amountTextField.errorMessage = @"Must Be Number";
        [self.amountTextField showErrorBubble];
        return NO;
    }
    else if ([cleanAmount integerValue] < 1) {
        self.amountTextField.errorMessage = @"Must be greater than USD 1";
        [self.amountTextField showErrorBubble];
        return NO;
    }
    return YES;
}

- (void)clearAllState {
    self.donateButtonTerm1.selected = FALSE;
    self.donateButtonTerm2.selected = FALSE;
    self.donateButtonTerm3.selected = FALSE;
    self.donateButtonTerm4.selected = FALSE;
    self.donateButtonTerm5.selected = FALSE;
    self.donateButtonTerm6.selected = FALSE;
}

- (IBAction)donateNowDidTapped:(id)sender {
    
    //    [self showDonationPlaceholderMessage];
    
    if (self.amountTextField.text.length < 1) {
        self.amountTextField.errorMessage = @"Can't be empty";
        [self.amountTextField showErrorBubble];
    }
    else if (![self validAmount]) {
        self.amountTextField.errorMessage = @"Input is not valid";
        [self.amountTextField showErrorBubble];
    }
    else if (![Util validateEmailWithString:self.emailTextField.text]) {
        self.emailTextField.errorMessage = @"Email is not valid";
        [self.emailTextField showErrorBubble];
    }
    else if(self.nameTextField.text.length < 1){
        self.nameTextField.errorMessage = @"Can't be empty";
        [self.nameTextField showErrorBubble];
    }
    else if(self.paymentSelectionTextField.text.length < 1){
        self.paymentSelectionTextField.errorMessage = @"Can't be empty";
        [self.paymentSelectionTextField showErrorBubble];
    }
    else if([self.paymentSelectionTextField.text isEqualToString:@"Project"] && self.projectSelectionTextField.text.length < 1) {
        self.projectSelectionTextField.errorMessage = @"Can't be empty";
        [self.projectSelectionTextField showErrorBubble];
    }
    else {
        NSMutableDictionary *parameters = [NSMutableDictionary new];
        [parameters setObject:self.amount forKey:@"amount"];
        [parameters setObject:[[NSUserDefaults standardUserDefaults] objectForKey:PREFS_CREDENTIALS_USER_ID] forKey:@"submerchantId"];
        [parameters setObject:self.emailTextField.text forKey:@"email"];
        [parameters setObject:self.paymentType.dataIdentifier forKey:@"paymentType"];
        [parameters setObject:self.remarkTextField.text.length?self.remarkTextField.text:@"-" forKey:@"remark"];
        [parameters setObject:self.nameTextField.text.length?self.nameTextField.text:@"-" forKey:@"name"];
        [parameters setObject:@"KIOSK" forKey:@"source"];
        //[[ExternalTrackingManager sharedInstance] logEvent:ACTION_MASJID_DONATION withProperties:parameters];
        if ([self.paymentSelectionTextField.text isEqualToString:@"Project"]) {
            [parameters setObject:self.projectType.dataIdentifier forKey:@"projectId"];
        }
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@%@",BASE_PAYMENT_URL,WEB_PAYMENT_URL,[Util encodeDictionary:parameters]]];
        
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            self.amountTextField.text = @"";
            self.remarkTextField.text = @"";
            self.paymentSelectionTextField.text = @"";
            self.nameTextField.text = @"";
            self.emailTextField.text = @"";
            self.projectSelectionTextField.text = @"";
            self.donationTextFieldHeight.constant = 0.0f;
            [[UIApplication sharedApplication] openURL:url];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    }
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSString *urlString = [URL absoluteString];
    if ([[urlString lowercaseString] isEqualToString:[@"tnc://" lowercaseString]]) {
        [self termsAndConditionLinkDidTapped];
    }
    else if ([[urlString lowercaseString] isEqualToString:[@"privacy://" lowercaseString]]) {
        [self privacyLinkDidTapped];
    }
    return NO;
}
- (void)termsAndConditionLinkDidTapped {
    [self openWebViewWithTitle:@"Terms of Service" andUrlToLoad:TOSA_URL];
}

- (void)privacyLinkDidTapped {
    [self openWebViewWithTitle:@"Privacy Policy" andUrlToLoad:POLICY_URL];
}
@end
