//
//  AuthStripe.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AuthStripe.h"


NSString *const kAuthStripeStripePublishableKey = @"stripe_publishable_key";
NSString *const kAuthStripeAccessToken = @"access_token";
NSString *const kAuthStripeStripeUserId = @"stripe_user_id";


@interface AuthStripe ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthStripe

@synthesize stripePublishableKey = _stripePublishableKey;
@synthesize accessToken = _accessToken;
@synthesize stripeUserId = _stripeUserId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.stripePublishableKey = [self objectOrNilForKey:kAuthStripeStripePublishableKey fromDictionary:dict];
            self.accessToken = [self objectOrNilForKey:kAuthStripeAccessToken fromDictionary:dict];
            self.stripeUserId = [self objectOrNilForKey:kAuthStripeStripeUserId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stripePublishableKey forKey:kAuthStripeStripePublishableKey];
    [mutableDict setValue:self.accessToken forKey:kAuthStripeAccessToken];
    [mutableDict setValue:self.stripeUserId forKey:kAuthStripeStripeUserId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.stripePublishableKey = [aDecoder decodeObjectForKey:kAuthStripeStripePublishableKey];
    self.accessToken = [aDecoder decodeObjectForKey:kAuthStripeAccessToken];
    self.stripeUserId = [aDecoder decodeObjectForKey:kAuthStripeStripeUserId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stripePublishableKey forKey:kAuthStripeStripePublishableKey];
    [aCoder encodeObject:_accessToken forKey:kAuthStripeAccessToken];
    [aCoder encodeObject:_stripeUserId forKey:kAuthStripeStripeUserId];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthStripe *copy = [[AuthStripe alloc] init];
    
    if (copy) {

        copy.stripePublishableKey = [self.stripePublishableKey copyWithZone:zone];
        copy.accessToken = [self.accessToken copyWithZone:zone];
        copy.stripeUserId = [self.stripeUserId copyWithZone:zone];
    }
    
    return copy;
}


@end
