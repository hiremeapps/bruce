//
//  ProjectEvent.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProjectVolunteer, ProjectParticipant;

@interface ProjectEvent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ProjectVolunteer *volunteer;
@property (nonatomic, strong) NSArray *volunteerData;
@property (nonatomic, strong) NSArray *participantData;
@property (nonatomic, strong) ProjectParticipant *participant;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
