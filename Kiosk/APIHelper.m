//
//  APIHelper.m
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "APIHelper.h"

@implementation APIHelper
+ (NSString *)pathAPI:(APIHelperRequestType)requestType {
    NSString *path = @"";
    switch (requestType) {
            case APIHelperRequestTypeKiosLogin:
            path = @"/api/v2/kiosk/auth";
            break;
            case APIHelperRequestTypeKioskPaymentList:
            path = @"/api/v2/kiosk/paymentmethod";
            break;
            case APIHelperRequestTypeKioskProjectList:
            path = @"/api/v2/kiosk/content/project/";
            break;
            
    }
    return path;
}
@end
