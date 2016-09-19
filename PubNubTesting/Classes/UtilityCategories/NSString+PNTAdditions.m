//
//  NSString+PNTAdditions.m
//  Pods
//
//  Created by Jordan Zucker on 6/20/16.
//
//

#import "NSString+PNTAdditions.h"

@implementation NSString (PNTAdditions)

+ (NSString *)PNT_randomAlphanumericStringWithLength:(NSInteger)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
