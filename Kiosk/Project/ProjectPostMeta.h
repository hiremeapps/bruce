//
//  ProjectPostMeta.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProjectPostMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *images;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
