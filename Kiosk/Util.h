//
//  Util.h
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (NSString *)limitCharacterForNewsFeed:(NSString *)feed;
+ (BOOL)isDateToday:(NSDate *)date1 compareDate:(NSDate *)date2;
+ (NSString *)humanizedCreatedTime:(NSString *)time;
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;
+ (NSString *)timeFormat:(NSString *)time;
+ (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat;
+ (NSString *)standarizeCalendar:(NSString *)time withFormat:(NSString *)format;
+ (BOOL)validateAllNumber:(NSString *)candidate;
+ (BOOL)stringToBool:(NSString *)string;
+ (BOOL)isNullValue:(id)value;
+ (NSDate *)currentDate;
+ (BOOL)isAlphabetCharactersOnlyFromText:(NSString *)text;
+ (BOOL)validateSpecialRequest:(NSString*)text;
+ (BOOL)validatePhoneNumber:(NSString *)candidate;
+ (BOOL)validateEmailWithString:(NSString*)email;
+ (NSString*)encodeDictionary:(NSDictionary*)dictionary;
+ (NSString *)formattedCurrencyWithCurrencySign:(NSString *)currencySign value:(NSInteger)value numDecimalPoint:(NSInteger)numOfDecimalPoint showSign:(BOOL)isShowSign;
@end
