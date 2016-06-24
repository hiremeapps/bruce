//
//  AuthStripe.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AuthStripe : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *stripePublishableKey;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *stripeUserId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
