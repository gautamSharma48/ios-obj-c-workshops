//
//  ViewController.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import "StringExtension.h"

@implementation NSString (StringExtension)
-(BOOL) validateString:(NSString *) value regexValue:(NSString *)regexValue {
    return  [self predicateString:regexValue withValue:value];
}
-(BOOL) predicateString:(NSString *)regex withValue:(NSString *)value {
    NSString *trimmedString = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isValid = [predicate evaluateWithObject:trimmedString];
    return isValid;
}

@end
