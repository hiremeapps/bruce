//
//  AuthAddress.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AuthAddress.h"
#import "AuthGeoLocation.h"


NSString *const kAuthAddressGeoLocation = @"geoLocation";
NSString *const kAuthAddressCity = @"city";


@interface AuthAddress ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthAddress

@synthesize geoLocation = _geoLocation;
@synthesize city = _city;


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
            self.geoLocation = [AuthGeoLocation modelObjectWithDictionary:[dict objectForKey:kAuthAddressGeoLocation]];
            self.city = [self objectOrNilForKey:kAuthAddressCity fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.geoLocation dictionaryRepresentation] forKey:kAuthAddressGeoLocation];
    [mutableDict setValue:self.city forKey:kAuthAddressCity];

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

    self.geoLocation = [aDecoder decodeObjectForKey:kAuthAddressGeoLocation];
    self.city = [aDecoder decodeObjectForKey:kAuthAddressCity];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_geoLocation forKey:kAuthAddressGeoLocation];
    [aCoder encodeObject:_city forKey:kAuthAddressCity];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthAddress *copy = [[AuthAddress alloc] init];
    
    if (copy) {

        copy.geoLocation = [self.geoLocation copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
    }
    
    return copy;
}


@end
