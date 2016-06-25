//
//  PaymentListData.h
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PaymentListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) BOOL active;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double v;
@property (nonatomic, assign) BOOL defaultPayment;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double fee;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *createdAt;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
