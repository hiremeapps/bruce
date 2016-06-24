//
//  APIHelper.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, APIHelperRequestType) {
    APIHelperRequestTypeKiosLogin
};
@interface APIHelper : NSObject
+ (NSString *)pathAPI:(APIHelperRequestType)requestType;
@end
