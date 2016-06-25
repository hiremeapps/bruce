//
//  ProjectResponse.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectResponse.h"
#import "ProjectData.h"
#import "APIManager.h"
#import "APIHelper.h"
#import "Configs.h"

NSString *const kProjectResponseStatus = @"status";
NSString *const kProjectResponseMessage = @"message";
NSString *const kProjectResponseData = @"data";


@interface ProjectResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectResponse

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
        self.status = [self objectOrNilForKey:kProjectResponseStatus fromDictionary:dict];
        self.message = [self objectOrNilForKey:kProjectResponseMessage fromDictionary:dict];
        NSObject *receivedProjectData = [dict objectForKey:kProjectResponseData];
        NSMutableArray *parsedProjectData = [NSMutableArray array];
        if ([receivedProjectData isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedProjectData) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedProjectData addObject:[ProjectData modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedProjectData isKindOfClass:[NSDictionary class]]) {
            [parsedProjectData addObject:[ProjectData modelObjectWithDictionary:(NSDictionary *)receivedProjectData]];
        }
        
        self.data = [NSArray arrayWithArray:parsedProjectData];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kProjectResponseStatus];
    [mutableDict setValue:self.message forKey:kProjectResponseMessage];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kProjectResponseData];
    
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
    
    self.status = [aDecoder decodeObjectForKey:kProjectResponseStatus];
    self.message = [aDecoder decodeObjectForKey:kProjectResponseMessage];
    self.data = [aDecoder decodeObjectForKey:kProjectResponseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_status forKey:kProjectResponseStatus];
    [aCoder encodeObject:_message forKey:kProjectResponseMessage];
    [aCoder encodeObject:_data forKey:kProjectResponseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectResponse *copy = [[ProjectResponse alloc] init];
    
    if (copy) {
        
        copy.status = [self.status copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}
+ (NSURLSessionDataTask *)projectList:(NSDictionary *)params CompletionBlock:(void(^)(ProjectResponse *response ,NSError *error))completion {
    return [[APIManager sharedClient] POST:[APIHelper pathAPI:APIHelperRequestTypeKioskProjectList] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        ProjectResponse *contentData = [[ProjectResponse alloc] initWithDictionary:responseObject];
        if (completion) {
            completion(contentData, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

@end
