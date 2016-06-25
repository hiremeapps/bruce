//
//  ProjectEvent.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectEvent.h"
#import "ProjectVolunteer.h"
#import "ProjectParticipant.h"


NSString *const kProjectEventVolunteer = @"volunteer";
NSString *const kProjectEventVolunteerData = @"volunteerData";
NSString *const kProjectEventParticipantData = @"participantData";
NSString *const kProjectEventParticipant = @"participant";


@interface ProjectEvent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectEvent

@synthesize volunteer = _volunteer;
@synthesize volunteerData = _volunteerData;
@synthesize participantData = _participantData;
@synthesize participant = _participant;


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
            self.volunteer = [ProjectVolunteer modelObjectWithDictionary:[dict objectForKey:kProjectEventVolunteer]];
            self.volunteerData = [self objectOrNilForKey:kProjectEventVolunteerData fromDictionary:dict];
            self.participantData = [self objectOrNilForKey:kProjectEventParticipantData fromDictionary:dict];
            self.participant = [ProjectParticipant modelObjectWithDictionary:[dict objectForKey:kProjectEventParticipant]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.volunteer dictionaryRepresentation] forKey:kProjectEventVolunteer];
    NSMutableArray *tempArrayForVolunteerData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.volunteerData) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVolunteerData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVolunteerData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVolunteerData] forKey:kProjectEventVolunteerData];
    NSMutableArray *tempArrayForParticipantData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.participantData) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParticipantData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParticipantData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParticipantData] forKey:kProjectEventParticipantData];
    [mutableDict setValue:[self.participant dictionaryRepresentation] forKey:kProjectEventParticipant];

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

    self.volunteer = [aDecoder decodeObjectForKey:kProjectEventVolunteer];
    self.volunteerData = [aDecoder decodeObjectForKey:kProjectEventVolunteerData];
    self.participantData = [aDecoder decodeObjectForKey:kProjectEventParticipantData];
    self.participant = [aDecoder decodeObjectForKey:kProjectEventParticipant];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_volunteer forKey:kProjectEventVolunteer];
    [aCoder encodeObject:_volunteerData forKey:kProjectEventVolunteerData];
    [aCoder encodeObject:_participantData forKey:kProjectEventParticipantData];
    [aCoder encodeObject:_participant forKey:kProjectEventParticipant];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectEvent *copy = [[ProjectEvent alloc] init];
    
    if (copy) {

        copy.volunteer = [self.volunteer copyWithZone:zone];
        copy.volunteerData = [self.volunteerData copyWithZone:zone];
        copy.participantData = [self.participantData copyWithZone:zone];
        copy.participant = [self.participant copyWithZone:zone];
    }
    
    return copy;
}


@end
