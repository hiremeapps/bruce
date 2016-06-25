//
//  ProjectProject.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProjectProject.h"


NSString *const kProjectProjectJamaah = @"jamaah";
NSString *const kProjectProjectFundRaisingMax = @"fundRaisingMax";
NSString *const kProjectProjectEndDate = @"endDate";
NSString *const kProjectProjectFundRaisingProgress = @"fundRaisingProgress";
NSString *const kProjectProjectStartDate = @"startDate";


@interface ProjectProject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProjectProject

@synthesize jamaah = _jamaah;
@synthesize fundRaisingMax = _fundRaisingMax;
@synthesize endDate = _endDate;
@synthesize fundRaisingProgress = _fundRaisingProgress;
@synthesize startDate = _startDate;


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
            self.jamaah = [self objectOrNilForKey:kProjectProjectJamaah fromDictionary:dict];
            self.fundRaisingMax = [[self objectOrNilForKey:kProjectProjectFundRaisingMax fromDictionary:dict] doubleValue];
            self.endDate = [self objectOrNilForKey:kProjectProjectEndDate fromDictionary:dict];
            self.fundRaisingProgress = [[self objectOrNilForKey:kProjectProjectFundRaisingProgress fromDictionary:dict] doubleValue];
            self.startDate = [self objectOrNilForKey:kProjectProjectStartDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForJamaah = [NSMutableArray array];
    for (NSObject *subArrayObject in self.jamaah) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForJamaah addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForJamaah addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForJamaah] forKey:kProjectProjectJamaah];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fundRaisingMax] forKey:kProjectProjectFundRaisingMax];
    [mutableDict setValue:self.endDate forKey:kProjectProjectEndDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fundRaisingProgress] forKey:kProjectProjectFundRaisingProgress];
    [mutableDict setValue:self.startDate forKey:kProjectProjectStartDate];

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

    self.jamaah = [aDecoder decodeObjectForKey:kProjectProjectJamaah];
    self.fundRaisingMax = [aDecoder decodeDoubleForKey:kProjectProjectFundRaisingMax];
    self.endDate = [aDecoder decodeObjectForKey:kProjectProjectEndDate];
    self.fundRaisingProgress = [aDecoder decodeDoubleForKey:kProjectProjectFundRaisingProgress];
    self.startDate = [aDecoder decodeObjectForKey:kProjectProjectStartDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_jamaah forKey:kProjectProjectJamaah];
    [aCoder encodeDouble:_fundRaisingMax forKey:kProjectProjectFundRaisingMax];
    [aCoder encodeObject:_endDate forKey:kProjectProjectEndDate];
    [aCoder encodeDouble:_fundRaisingProgress forKey:kProjectProjectFundRaisingProgress];
    [aCoder encodeObject:_startDate forKey:kProjectProjectStartDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProjectProject *copy = [[ProjectProject alloc] init];
    
    if (copy) {

        copy.jamaah = [self.jamaah copyWithZone:zone];
        copy.fundRaisingMax = self.fundRaisingMax;
        copy.endDate = [self.endDate copyWithZone:zone];
        copy.fundRaisingProgress = self.fundRaisingProgress;
        copy.startDate = [self.startDate copyWithZone:zone];
    }
    
    return copy;
}


@end
