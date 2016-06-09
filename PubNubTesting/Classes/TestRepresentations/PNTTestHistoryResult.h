//
//  PNTTestHistoryResult.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestResult.h"

@interface PNTTestHistoryResult : PNTTestResult <PNTTestRepresentation>

@property (nonatomic, strong, readonly) NSNumber *start;
@property (nonatomic, strong, readonly) NSNumber *end;
@property (nonatomic, strong, readonly) NSArray *messages;

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;

+ (instancetype)successfulResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;



@end
