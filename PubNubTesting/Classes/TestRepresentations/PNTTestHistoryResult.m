//
//  PNTTestHistoryResult.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestHistoryResult.h"

@interface PNTTestHistoryResult ()
@property (nonatomic, strong, readwrite) NSNumber *start;
@property (nonatomic, strong, readwrite) NSNumber *end;
@property (nonatomic, strong, readwrite) NSArray *messages;
@end

@implementation PNTTestHistoryResult

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    self = [super initWithClient:client statusCode:statusCode operation:PNHistoryOperation];
    if (self) {
        _start = start;
        _end = end;
        _messages = messages;
    }
    return self;
}

+ (instancetype)successfulResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    return [[self alloc] initHistoryResultWithClient:client statusCode:statusCode isError:NO start:start end:end messages:messages];
}

- (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.start",
             @"data.end",
             @"data.messages",
             ];
}

@end
