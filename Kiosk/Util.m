//
//  Util.m
//  Masjid Pay
//
//  Created by Arie on 3/13/16.
//  Copyright © 2016 Dalvk Studio. All rights reserved.
//

#import "Util.h"
@implementation Util

+ (BOOL)isDateToday:(NSDate *)date1 compareDate:(NSDate *)date2 {
    if ([date1 compare:date2] == NSOrderedDescending) {
        return false;
    } else if ([date1 compare:date2] == NSOrderedAscending) {
        return false;
    } else {
        return true;
    }
}

+ (NSString *)limitCharacterForNewsFeed:(NSString *)feed {
    if ([feed length] > 50) {
        NSRange range = [feed rangeOfComposedCharacterSequencesForRange:(NSRange){0, 50}];
        feed = [feed substringWithRange:range];
        feed = [feed stringByAppendingString:@"..."];
        return feed;
    }
    else {
        return feed;
    }
}
+ (NSDate *)currentDate {
    return [NSDate date];
}

+ (NSString *)dateStringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [Util dateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [Util dateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter dateFromString:dateString];
}
+ (NSString *)timeFormat:(NSString *)time {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    NSDate *date = [dateFormatter dateFromString:time];
    
    [dateFormatter setDateFormat:@"hh:mm a"];
    return [dateFormatter stringFromDate:date];
    
}
+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return dateFormatter;
}



+ (NSString *)standarizeCalendar:(NSString *)time withFormat:(NSString *)format {
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    if (format.length < 1) {
        format = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    }
    [dateFormatter1 setDateFormat:format];
    NSDate *date = [dateFormatter1 dateFromString:time];
    
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    NSTimeZone *utcTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:date];
    NSInteger gmtOffset = [utcTimeZone secondsFromGMTForDate:date];
    NSTimeInterval gmtInterval = currentGMTOffset - gmtOffset;
    
    NSDate *destinationDate = [[NSDate alloc] initWithTimeInterval:gmtInterval sinceDate:date];
    
    NSDateFormatter *dateFormatters = [[NSDateFormatter alloc] init];
    [dateFormatters setDateFormat:@"dd-MMM-yyyy hh:mm"];
    [dateFormatters setDateStyle:NSDateFormatterShortStyle];
    [dateFormatters setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatters setDoesRelativeDateFormatting:YES];
    [dateFormatters setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [self dateStringFromDate:destinationDate withFormat:@"MMM d, YYYY"];
}

+ (BOOL)validateAllNumber:(NSString *)candidate {
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", numberRegex];
    
    return [numberTest evaluateWithObject:candidate];
}

+ (BOOL)stringToBool:(NSString *)string {
    return ([string isEqualToString:@"true"]);
}

+ (BOOL)validatePhoneNumber:(NSString *)candidate {
    NSString *phoneNumberRegex = @"^\\+?[0-9]*$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:candidate];
}

+ (BOOL)validateEmailWithString:(NSString*)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (NSString *)formattedCurrencyWithCurrencySign:(NSString *)currencySign value:(NSInteger)value numDecimalPoint:(NSInteger)numOfDecimalPoint showSign:(BOOL)isShowSign {
    static NSNumberFormatter *numberFormatter;
    
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        numberFormatter.usesGroupingSeparator = YES;
    }
    NSNumber *number = [NSNumber numberWithDouble:((double)value / pow(10, numOfDecimalPoint))];
    if (isShowSign) {
        NSString *numberString = [numberFormatter stringFromNumber:number];
        
        if ([currencySign isEqualToString:@"VND"]) {
            return [NSString stringWithFormat:@"%@%@", numberString, currencySign];
        }
        else {
            return [NSString stringWithFormat:@"%@%@", currencySign, numberString];
        }
    }
    else {
        return [numberFormatter stringFromNumber:number];
    }
}
+ (NSString*)encodeDictionary:(NSDictionary*)dictionary {
    NSMutableString *bodyData = [[NSMutableString alloc]init];
    int i = 0;
    for (NSString *key in dictionary.allKeys) {
        i++;
        [bodyData appendFormat:@"%@=",key];
        NSString *value = [dictionary valueForKey:key];
        NSString *newString = [value stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        [bodyData appendString:newString];
        if (i < dictionary.allKeys.count) {
            [bodyData appendString:@"&"];
        }
    }
    return bodyData;
}
@end
