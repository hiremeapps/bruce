//
//  NSString+Validation.m
//  Masjid Pay
//
//  Created by Arie on 4/10/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isEmpty {
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return (string.length == 0);
}

- (BOOL)isValidEmail {
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidCommonName {
    NSString *nameRegex = @"^[a-z ]+$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", nameRegex];
    return [nameTest evaluateWithObject:self];
}

- (BOOL)isValidNumber {
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", numberRegex];
    return [numberTest evaluateWithObject:self];
}

- (BOOL)isValidPhoneNumber {
    NSString *phoneNumberRegex = @"^\\+?[0-9]*$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:self] && self.length >= 6;
}

- (BOOL)isValidUsingPlusPhoneNumber {
    NSString *phoneNumberRegex = @"^\\+[0-9]*$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:self];
}

@end
