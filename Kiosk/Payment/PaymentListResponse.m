//
//  PaymentListResponse.m
//
//  Created by Arie  on 6/25/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PaymentListResponse.h"
#import "PaymentListData.h"
#import "APIManager.h"
#import "APIHelper.h"
#import "Configs.h"

NSString *const kPaymentListResponseStatus = @"status";
NSString *const kPaymentListResponseMessage = @"message";
NSString *const kPaymentListResponseData = @"data";


@interface PaymentListResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PaymentListResponse

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
        self.status = [self objectOrNilForKey:kPaymentListResponseStatus fromDictionary:dict];
        self.message = [self objectOrNilForKey:kPaymentListResponseMessage fromDictionary:dict];
        NSObject *receivedPaymentListData = [dict objectForKey:kPaymentListResponseData];
        NSMutableArray *parsedPaymentListData = [NSMutableArray array];
        if ([receivedPaymentListData isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedPaymentListData) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedPaymentListData addObject:[PaymentListData modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedPaymentListData isKindOfClass:[NSDictionary class]]) {
            [parsedPaymentListData addObject:[PaymentListData modelObjectWithDictionary:(NSDictionary *)receivedPaymentListData]];
        }
        
        self.data = [NSArray arrayWithArray:parsedPaymentListData];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kPaymentListResponseStatus];
    [mutableDict setValue:self.message forKey:kPaymentListResponseMessage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kPaymentListResponseData];
    
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
    
    self.status = [aDecoder decodeObjectForKey:kPaymentListResponseStatus];
    self.message = [aDecoder decodeObjectForKey:kPaymentListResponseMessage];
    self.data = [aDecoder decodeObjectForKey:kPaymentListResponseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_status forKey:kPaymentListResponseStatus];
    [aCoder encodeObject:_message forKey:kPaymentListResponseMessage];
    [aCoder encodeObject:_data forKey:kPaymentListResponseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    PaymentListResponse *copy = [[PaymentListResponse alloc] init];
    
    if (copy) {
        
        copy.status = [self.status copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}
+ (NSURLSessionDataTask *)paymentList:(NSDictionary *)params CompletionBlock:(void(^)(PaymentListResponse *response ,NSError *error))completion {
    return [[APIManager sharedClient] POST:[APIHelper pathAPI:APIHelperRequestTypeKioskPaymentList] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        PaymentListResponse *contentData = [[PaymentListResponse alloc] initWithDictionary:responseObject];
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
