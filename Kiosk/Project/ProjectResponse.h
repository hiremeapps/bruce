//
//  ProjectResponse.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProjectResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
+ (NSURLSessionDataTask *)projectList:(NSDictionary *)params CompletionBlock:(void(^)(ProjectResponse *response ,NSError *error))completion;
@end
