//
//  ProjectProject.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProjectProject : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *jamaah;
@property (nonatomic, assign) double fundRaisingMax;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, assign) double fundRaisingProgress;
@property (nonatomic, strong) NSString *startDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
