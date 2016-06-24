//
//  AuthAddress.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AuthGeoLocation;

@interface AuthAddress : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) AuthGeoLocation *geoLocation;
@property (nonatomic, strong) NSString *city;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
