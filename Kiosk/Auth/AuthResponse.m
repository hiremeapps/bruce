//
//  AuthResponse.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "AuthResponse.h"
#import "AuthData.h"


NSString *const kAuthResponseStatus = @"status";
NSString *const kAuthResponseMessage = @"message";
NSString *const kAuthResponseData = @"data";


@interface AuthResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AuthResponse

@synthesize status = _status;
@synthesize message = _message;
@synthesize data = _data;


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
        self.status = [self objectOrNilForKey:kAuthResponseStatus fromDictionary:dict];
        self.message = [self objectOrNilForKey:kAuthResponseMessage fromDictionary:dict];
        self.data = [AuthData modelObjectWithDictionary:[dict objectForKey:kAuthResponseData]];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kAuthResponseStatus];
    [mutableDict setValue:self.message forKey:kAuthResponseMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kAuthResponseData];
    
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
    
    self.status = [aDecoder decodeObjectForKey:kAuthResponseStatus];
    self.message = [aDecoder decodeObjectForKey:kAuthResponseMessage];
    self.data = [aDecoder decodeObjectForKey:kAuthResponseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_status forKey:kAuthResponseStatus];
    [aCoder encodeObject:_message forKey:kAuthResponseMessage];
    [aCoder encodeObject:_data forKey:kAuthResponseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    AuthResponse *copy = [[AuthResponse alloc] init];
    
    if (copy) {
        
        copy.status = [self.status copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
