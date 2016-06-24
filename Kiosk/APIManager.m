//
//  APIManager.m
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "APIManager.h"
#import "Configs.h"
@implementation APIManager
+ (instancetype)sharedClient {
    static APIManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_API_URL]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        [_sharedClient.requestSerializer setAuthorizationHeaderFieldWithUsername:@"masjidpayPartner" password:@"bWFzamlkcGF5"];
        //        [_sharedClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    });
    
    return _sharedClient;
}

@end
