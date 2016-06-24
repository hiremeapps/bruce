//
//  AuthData.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AuthData.h"
#import "AuthStripe.h"
#import "AuthActivateEmail.h"
#import "AuthAddress.h"


NSString *const kAuthDataParentId = @"parentId";
NSString *const kAuthDataUpdatedAt = @"updatedAt";
NSString *const kAuthDataFirstName = @"firstName";
NSString *const kAuthDataStripe = @"stripe";
NSString *const kAuthDataPaymentMethod = @"paymentMethod";
NSString *const kAuthDataUserRole = @"userRole";
NSString *const kAuthDataVerified = @"verified";
NSString *const kAuthDataId = @"_id";
NSString *const kAuthDataIsMasjid = @"isMasjid";
NSString *const kAuthDataHasMasjid = @"hasMasjid";
NSString *const kAuthDataActivateEmail = @"activateEmail";
NSString *const kAuthDataToken = @"token";
NSString *const kAuthDataAddress = @"address";
NSString *const kAuthDataVerificationEmail = @"verificationEmail";
NSString *const kAuthDataImages = @"images";
NSString *const kAuthDataEmail = @"email";
NSString *const kAuthDataCreatedAt = @"createdAt";
NSString *const kAuthDataSpecialAdjustment = @"specialAdjustment";


@interface AuthData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthData

@synthesize parentId = _parentId;
@synthesize updatedAt = _updatedAt;
@synthesize firstName = _firstName;
@synthesize stripe = _stripe;
@synthesize paymentMethod = _paymentMethod;
@synthesize userRole = _userRole;
@synthesize verified = _verified;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize isMasjid = _isMasjid;
@synthesize hasMasjid = _hasMasjid;
@synthesize activateEmail = _activateEmail;
@synthesize token = _token;
@synthesize address = _address;
@synthesize verificationEmail = _verificationEmail;
@synthesize images = _images;
@synthesize email = _email;
@synthesize createdAt = _createdAt;
@synthesize specialAdjustment = _specialAdjustment;


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
            self.parentId = [self objectOrNilForKey:kAuthDataParentId fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kAuthDataUpdatedAt fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kAuthDataFirstName fromDictionary:dict];
            self.stripe = [AuthStripe modelObjectWithDictionary:[dict objectForKey:kAuthDataStripe]];
            self.paymentMethod = [self objectOrNilForKey:kAuthDataPaymentMethod fromDictionary:dict];
            self.userRole = [[self objectOrNilForKey:kAuthDataUserRole fromDictionary:dict] doubleValue];
            self.verified = [[self objectOrNilForKey:kAuthDataVerified fromDictionary:dict] doubleValue];
            self.dataIdentifier = [self objectOrNilForKey:kAuthDataId fromDictionary:dict];
            self.isMasjid = [[self objectOrNilForKey:kAuthDataIsMasjid fromDictionary:dict] boolValue];
            self.hasMasjid = [[self objectOrNilForKey:kAuthDataHasMasjid fromDictionary:dict] boolValue];
            self.activateEmail = [AuthActivateEmail modelObjectWithDictionary:[dict objectForKey:kAuthDataActivateEmail]];
            self.token = [self objectOrNilForKey:kAuthDataToken fromDictionary:dict];
            self.address = [AuthAddress modelObjectWithDictionary:[dict objectForKey:kAuthDataAddress]];
            self.verificationEmail = [[self objectOrNilForKey:kAuthDataVerificationEmail fromDictionary:dict] boolValue];
            self.images = [self objectOrNilForKey:kAuthDataImages fromDictionary:dict];
            self.email = [self objectOrNilForKey:kAuthDataEmail fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kAuthDataCreatedAt fromDictionary:dict];
            self.specialAdjustment = [[self objectOrNilForKey:kAuthDataSpecialAdjustment fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.parentId forKey:kAuthDataParentId];
    [mutableDict setValue:self.updatedAt forKey:kAuthDataUpdatedAt];
    [mutableDict setValue:self.firstName forKey:kAuthDataFirstName];
    [mutableDict setValue:[self.stripe dictionaryRepresentation] forKey:kAuthDataStripe];
    NSMutableArray *tempArrayForPaymentMethod = [NSMutableArray array];
    for (NSObject *subArrayObject in self.paymentMethod) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPaymentMethod addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPaymentMethod addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPaymentMethod] forKey:kAuthDataPaymentMethod];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userRole] forKey:kAuthDataUserRole];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verified] forKey:kAuthDataVerified];
    [mutableDict setValue:self.dataIdentifier forKey:kAuthDataId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMasjid] forKey:kAuthDataIsMasjid];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMasjid] forKey:kAuthDataHasMasjid];
    [mutableDict setValue:[self.activateEmail dictionaryRepresentation] forKey:kAuthDataActivateEmail];
    [mutableDict setValue:self.token forKey:kAuthDataToken];
    [mutableDict setValue:[self.address dictionaryRepresentation] forKey:kAuthDataAddress];
    [mutableDict setValue:[NSNumber numberWithBool:self.verificationEmail] forKey:kAuthDataVerificationEmail];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kAuthDataImages];
    [mutableDict setValue:self.email forKey:kAuthDataEmail];
    [mutableDict setValue:self.createdAt forKey:kAuthDataCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialAdjustment] forKey:kAuthDataSpecialAdjustment];

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

    self.parentId = [aDecoder decodeObjectForKey:kAuthDataParentId];
    self.updatedAt = [aDecoder decodeObjectForKey:kAuthDataUpdatedAt];
    self.firstName = [aDecoder decodeObjectForKey:kAuthDataFirstName];
    self.stripe = [aDecoder decodeObjectForKey:kAuthDataStripe];
    self.paymentMethod = [aDecoder decodeObjectForKey:kAuthDataPaymentMethod];
    self.userRole = [aDecoder decodeDoubleForKey:kAuthDataUserRole];
    self.verified = [aDecoder decodeDoubleForKey:kAuthDataVerified];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kAuthDataId];
    self.isMasjid = [aDecoder decodeBoolForKey:kAuthDataIsMasjid];
    self.hasMasjid = [aDecoder decodeBoolForKey:kAuthDataHasMasjid];
    self.activateEmail = [aDecoder decodeObjectForKey:kAuthDataActivateEmail];
    self.token = [aDecoder decodeObjectForKey:kAuthDataToken];
    self.address = [aDecoder decodeObjectForKey:kAuthDataAddress];
    self.verificationEmail = [aDecoder decodeBoolForKey:kAuthDataVerificationEmail];
    self.images = [aDecoder decodeObjectForKey:kAuthDataImages];
    self.email = [aDecoder decodeObjectForKey:kAuthDataEmail];
    self.createdAt = [aDecoder decodeObjectForKey:kAuthDataCreatedAt];
    self.specialAdjustment = [aDecoder decodeDoubleForKey:kAuthDataSpecialAdjustment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_parentId forKey:kAuthDataParentId];
    [aCoder encodeObject:_updatedAt forKey:kAuthDataUpdatedAt];
    [aCoder encodeObject:_firstName forKey:kAuthDataFirstName];
    [aCoder encodeObject:_stripe forKey:kAuthDataStripe];
    [aCoder encodeObject:_paymentMethod forKey:kAuthDataPaymentMethod];
    [aCoder encodeDouble:_userRole forKey:kAuthDataUserRole];
    [aCoder encodeDouble:_verified forKey:kAuthDataVerified];
    [aCoder encodeObject:_dataIdentifier forKey:kAuthDataId];
    [aCoder encodeBool:_isMasjid forKey:kAuthDataIsMasjid];
    [aCoder encodeBool:_hasMasjid forKey:kAuthDataHasMasjid];
    [aCoder encodeObject:_activateEmail forKey:kAuthDataActivateEmail];
    [aCoder encodeObject:_token forKey:kAuthDataToken];
    [aCoder encodeObject:_address forKey:kAuthDataAddress];
    [aCoder encodeBool:_verificationEmail forKey:kAuthDataVerificationEmail];
    [aCoder encodeObject:_images forKey:kAuthDataImages];
    [aCoder encodeObject:_email forKey:kAuthDataEmail];
    [aCoder encodeObject:_createdAt forKey:kAuthDataCreatedAt];
    [aCoder encodeDouble:_specialAdjustment forKey:kAuthDataSpecialAdjustment];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthData *copy = [[AuthData alloc] init];
    
    if (copy) {

        copy.parentId = [self.parentId copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.stripe = [self.stripe copyWithZone:zone];
        copy.paymentMethod = [self.paymentMethod copyWithZone:zone];
        copy.userRole = self.userRole;
        copy.verified = self.verified;
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.isMasjid = self.isMasjid;
        copy.hasMasjid = self.hasMasjid;
        copy.activateEmail = [self.activateEmail copyWithZone:zone];
        copy.token = [self.token copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.verificationEmail = self.verificationEmail;
        copy.images = [self.images copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.specialAdjustment = self.specialAdjustment;
    }
    
    return copy;
}


@end
