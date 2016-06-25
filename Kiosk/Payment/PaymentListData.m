//
//  PaymentListData.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PaymentListData.h"


NSString *const kPaymentListDataId = @"_id";
NSString *const kPaymentListDataActive = @"active";
NSString *const kPaymentListDataName = @"name";
NSString *const kPaymentListDataV = @"__v";
NSString *const kPaymentListDataDefaultPayment = @"defaultPayment";
NSString *const kPaymentListDataUpdatedAt = @"updatedAt";
NSString *const kPaymentListDataType = @"type";
NSString *const kPaymentListDataFee = @"fee";
NSString *const kPaymentListDataDescription = @"description";
NSString *const kPaymentListDataCreatedAt = @"createdAt";


@interface PaymentListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PaymentListData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize active = _active;
@synthesize name = _name;
@synthesize v = _v;
@synthesize defaultPayment = _defaultPayment;
@synthesize updatedAt = _updatedAt;
@synthesize type = _type;
@synthesize fee = _fee;
@synthesize dataDescription = _dataDescription;
@synthesize createdAt = _createdAt;


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
            self.dataIdentifier = [self objectOrNilForKey:kPaymentListDataId fromDictionary:dict];
            self.active = [[self objectOrNilForKey:kPaymentListDataActive fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:kPaymentListDataName fromDictionary:dict];
            self.v = [[self objectOrNilForKey:kPaymentListDataV fromDictionary:dict] doubleValue];
            self.defaultPayment = [[self objectOrNilForKey:kPaymentListDataDefaultPayment fromDictionary:dict] boolValue];
            self.updatedAt = [self objectOrNilForKey:kPaymentListDataUpdatedAt fromDictionary:dict];
            self.type = [self objectOrNilForKey:kPaymentListDataType fromDictionary:dict];
            self.fee = [[self objectOrNilForKey:kPaymentListDataFee fromDictionary:dict] doubleValue];
            self.dataDescription = [self objectOrNilForKey:kPaymentListDataDescription fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kPaymentListDataCreatedAt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kPaymentListDataId];
    [mutableDict setValue:[NSNumber numberWithBool:self.active] forKey:kPaymentListDataActive];
    [mutableDict setValue:self.name forKey:kPaymentListDataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.v] forKey:kPaymentListDataV];
    [mutableDict setValue:[NSNumber numberWithBool:self.defaultPayment] forKey:kPaymentListDataDefaultPayment];
    [mutableDict setValue:self.updatedAt forKey:kPaymentListDataUpdatedAt];
    [mutableDict setValue:self.type forKey:kPaymentListDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fee] forKey:kPaymentListDataFee];
    [mutableDict setValue:self.dataDescription forKey:kPaymentListDataDescription];
    [mutableDict setValue:self.createdAt forKey:kPaymentListDataCreatedAt];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kPaymentListDataId];
    self.active = [aDecoder decodeBoolForKey:kPaymentListDataActive];
    self.name = [aDecoder decodeObjectForKey:kPaymentListDataName];
    self.v = [aDecoder decodeDoubleForKey:kPaymentListDataV];
    self.defaultPayment = [aDecoder decodeBoolForKey:kPaymentListDataDefaultPayment];
    self.updatedAt = [aDecoder decodeObjectForKey:kPaymentListDataUpdatedAt];
    self.type = [aDecoder decodeObjectForKey:kPaymentListDataType];
    self.fee = [aDecoder decodeDoubleForKey:kPaymentListDataFee];
    self.dataDescription = [aDecoder decodeObjectForKey:kPaymentListDataDescription];
    self.createdAt = [aDecoder decodeObjectForKey:kPaymentListDataCreatedAt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kPaymentListDataId];
    [aCoder encodeBool:_active forKey:kPaymentListDataActive];
    [aCoder encodeObject:_name forKey:kPaymentListDataName];
    [aCoder encodeDouble:_v forKey:kPaymentListDataV];
    [aCoder encodeBool:_defaultPayment forKey:kPaymentListDataDefaultPayment];
    [aCoder encodeObject:_updatedAt forKey:kPaymentListDataUpdatedAt];
    [aCoder encodeObject:_type forKey:kPaymentListDataType];
    [aCoder encodeDouble:_fee forKey:kPaymentListDataFee];
    [aCoder encodeObject:_dataDescription forKey:kPaymentListDataDescription];
    [aCoder encodeObject:_createdAt forKey:kPaymentListDataCreatedAt];
}

- (id)copyWithZone:(NSZone *)zone
{
    PaymentListData *copy = [[PaymentListData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.active = self.active;
        copy.name = [self.name copyWithZone:zone];
        copy.v = self.v;
        copy.defaultPayment = self.defaultPayment;
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.fee = self.fee;
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
    }
    
    return copy;
}


@end
