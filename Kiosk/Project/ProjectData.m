//
//  ProjectData.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectData.h"
#import "ProjectPostMeta.h"
#import "ProjectEvent.h"
#import "ProjectProject.h"


NSString *const kProjectDataId = @"_id";
NSString *const kProjectDataPostMeta = @"postMeta";
NSString *const kProjectDataPublishedStatus = @"publishedStatus";
NSString *const kProjectDataV = @"__v";
NSString *const kProjectDataEvent = @"event";
NSString *const kProjectDataWriter = @"writer";
NSString *const kProjectDataCreator = @"_creator";
NSString *const kProjectDataUpdatedAt = @"updatedAt";
NSString *const kProjectDataCreatedAt = @"createdAt";
NSString *const kProjectDataProject = @"project";


@interface ProjectData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize postMeta = _postMeta;
@synthesize publishedStatus = _publishedStatus;
@synthesize v = _v;
@synthesize event = _event;
@synthesize writer = _writer;
@synthesize creator = _creator;
@synthesize updatedAt = _updatedAt;
@synthesize createdAt = _createdAt;
@synthesize project = _project;


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
            self.dataIdentifier = [self objectOrNilForKey:kProjectDataId fromDictionary:dict];
            self.postMeta = [ProjectPostMeta modelObjectWithDictionary:[dict objectForKey:kProjectDataPostMeta]];
            self.publishedStatus = [self objectOrNilForKey:kProjectDataPublishedStatus fromDictionary:dict];
            self.v = [[self objectOrNilForKey:kProjectDataV fromDictionary:dict] doubleValue];
            self.event = [ProjectEvent modelObjectWithDictionary:[dict objectForKey:kProjectDataEvent]];
            self.writer = [self objectOrNilForKey:kProjectDataWriter fromDictionary:dict];
            self.creator = [self objectOrNilForKey:kProjectDataCreator fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kProjectDataUpdatedAt fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kProjectDataCreatedAt fromDictionary:dict];
            self.project = [ProjectProject modelObjectWithDictionary:[dict objectForKey:kProjectDataProject]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kProjectDataId];
    [mutableDict setValue:[self.postMeta dictionaryRepresentation] forKey:kProjectDataPostMeta];
    [mutableDict setValue:self.publishedStatus forKey:kProjectDataPublishedStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.v] forKey:kProjectDataV];
    [mutableDict setValue:[self.event dictionaryRepresentation] forKey:kProjectDataEvent];
    [mutableDict setValue:self.writer forKey:kProjectDataWriter];
    [mutableDict setValue:self.creator forKey:kProjectDataCreator];
    [mutableDict setValue:self.updatedAt forKey:kProjectDataUpdatedAt];
    [mutableDict setValue:self.createdAt forKey:kProjectDataCreatedAt];
    [mutableDict setValue:[self.project dictionaryRepresentation] forKey:kProjectDataProject];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kProjectDataId];
    self.postMeta = [aDecoder decodeObjectForKey:kProjectDataPostMeta];
    self.publishedStatus = [aDecoder decodeObjectForKey:kProjectDataPublishedStatus];
    self.v = [aDecoder decodeDoubleForKey:kProjectDataV];
    self.event = [aDecoder decodeObjectForKey:kProjectDataEvent];
    self.writer = [aDecoder decodeObjectForKey:kProjectDataWriter];
    self.creator = [aDecoder decodeObjectForKey:kProjectDataCreator];
    self.updatedAt = [aDecoder decodeObjectForKey:kProjectDataUpdatedAt];
    self.createdAt = [aDecoder decodeObjectForKey:kProjectDataCreatedAt];
    self.project = [aDecoder decodeObjectForKey:kProjectDataProject];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kProjectDataId];
    [aCoder encodeObject:_postMeta forKey:kProjectDataPostMeta];
    [aCoder encodeObject:_publishedStatus forKey:kProjectDataPublishedStatus];
    [aCoder encodeDouble:_v forKey:kProjectDataV];
    [aCoder encodeObject:_event forKey:kProjectDataEvent];
    [aCoder encodeObject:_writer forKey:kProjectDataWriter];
    [aCoder encodeObject:_creator forKey:kProjectDataCreator];
    [aCoder encodeObject:_updatedAt forKey:kProjectDataUpdatedAt];
    [aCoder encodeObject:_createdAt forKey:kProjectDataCreatedAt];
    [aCoder encodeObject:_project forKey:kProjectDataProject];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectData *copy = [[ProjectData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.postMeta = [self.postMeta copyWithZone:zone];
        copy.publishedStatus = [self.publishedStatus copyWithZone:zone];
        copy.v = self.v;
        copy.event = [self.event copyWithZone:zone];
        copy.writer = [self.writer copyWithZone:zone];
        copy.creator = [self.creator copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.project = [self.project copyWithZone:zone];
    }
    
    return copy;
}


@end
