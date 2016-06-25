//
//  ProjectParticipant.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectParticipant.h"


NSString *const kProjectParticipantFee = @"fee";
NSString *const kProjectParticipantAccept = @"accept";


@interface ProjectParticipant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectParticipant

@synthesize fee = _fee;
@synthesize accept = _accept;


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
            self.fee = [[self objectOrNilForKey:kProjectParticipantFee fromDictionary:dict] doubleValue];
            self.accept = [[self objectOrNilForKey:kProjectParticipantAccept fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fee] forKey:kProjectParticipantFee];
    [mutableDict setValue:[NSNumber numberWithBool:self.accept] forKey:kProjectParticipantAccept];

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

    self.fee = [aDecoder decodeDoubleForKey:kProjectParticipantFee];
    self.accept = [aDecoder decodeBoolForKey:kProjectParticipantAccept];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_fee forKey:kProjectParticipantFee];
    [aCoder encodeBool:_accept forKey:kProjectParticipantAccept];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectParticipant *copy = [[ProjectParticipant alloc] init];
    
    if (copy) {

        copy.fee = self.fee;
        copy.accept = self.accept;
    }
    
    return copy;
}


@end
