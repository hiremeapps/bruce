//
//  ProjectParticipant.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProjectParticipant : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double fee;
@property (nonatomic, assign) BOOL accept;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
