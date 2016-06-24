//
//  NSString+Validation.h
//  Masjid Pay
//
//  Created by Arie on 4/10/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
- (BOOL)isEmpty;
- (BOOL)isValidEmail;
- (BOOL)isValidCommonName;
- (BOOL)isValidNumber;
- (BOOL)isValidPhoneNumber;
- (BOOL)isValidUsingPlusPhoneNumber;
@end
