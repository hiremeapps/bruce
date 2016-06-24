//
//  APIManager.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
@interface APIManager : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
