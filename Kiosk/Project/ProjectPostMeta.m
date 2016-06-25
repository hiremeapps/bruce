//
//  ProjectPostMeta.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectPostMeta.h"


NSString *const kProjectPostMetaContent = @"content";
NSString *const kProjectPostMetaTitle = @"title";
NSString *const kProjectPostMetaImages = @"images";


@interface ProjectPostMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectPostMeta

@synthesize content = _content;
@synthesize title = _title;
@synthesize images = _images;


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
            self.content = [self objectOrNilForKey:kProjectPostMetaContent fromDictionary:dict];
            self.title = [self objectOrNilForKey:kProjectPostMetaTitle fromDictionary:dict];
            self.images = [self objectOrNilForKey:kProjectPostMetaImages fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kProjectPostMetaContent];
    [mutableDict setValue:self.title forKey:kProjectPostMetaTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kProjectPostMetaImages];

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

    self.content = [aDecoder decodeObjectForKey:kProjectPostMetaContent];
    self.title = [aDecoder decodeObjectForKey:kProjectPostMetaTitle];
    self.images = [aDecoder decodeObjectForKey:kProjectPostMetaImages];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kProjectPostMetaContent];
    [aCoder encodeObject:_title forKey:kProjectPostMetaTitle];
    [aCoder encodeObject:_images forKey:kProjectPostMetaImages];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectPostMeta *copy = [[ProjectPostMeta alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
    }
    
    return copy;
}


@end
