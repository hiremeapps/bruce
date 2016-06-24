//
//  AuthData.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AuthStripe, AuthActivateEmail, AuthAddress;

@interface AuthData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) AuthStripe *stripe;
@property (nonatomic, strong) NSArray *paymentMethod;
@property (nonatomic, assign) double userRole;
@property (nonatomic, assign) double verified;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) BOOL isMasjid;
@property (nonatomic, assign) BOOL hasMasjid;
@property (nonatomic, strong) AuthActivateEmail *activateEmail;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) AuthAddress *address;
@property (nonatomic, assign) BOOL verificationEmail;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double specialAdjustment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
