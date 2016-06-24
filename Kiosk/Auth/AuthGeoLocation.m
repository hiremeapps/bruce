//
//  AuthGeoLocation.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AuthGeoLocation.h"


NSString *const kAuthGeoLocationLongitude = @"longitude";
NSString *const kAuthGeoLocationLatitude = @"latitude";


@interface AuthGeoLocation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthGeoLocation

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;


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
            self.longitude = [[self objectOrNilForKey:kAuthGeoLocationLongitude fromDictionary:dict] doubleValue];
            self.latitude = [[self objectOrNilForKey:kAuthGeoLocationLatitude fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kAuthGeoLocationLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kAuthGeoLocationLatitude];

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

    self.longitude = [aDecoder decodeDoubleForKey:kAuthGeoLocationLongitude];
    self.latitude = [aDecoder decodeDoubleForKey:kAuthGeoLocationLatitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_longitude forKey:kAuthGeoLocationLongitude];
    [aCoder encodeDouble:_latitude forKey:kAuthGeoLocationLatitude];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthGeoLocation *copy = [[AuthGeoLocation alloc] init];
    
    if (copy) {

        copy.longitude = self.longitude;
        copy.latitude = self.latitude;
    }
    
    return copy;
}


@end
