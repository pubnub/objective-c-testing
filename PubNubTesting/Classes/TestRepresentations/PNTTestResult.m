//
//  PNTTestResult.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestResult.h"

@interface PNTTestResult ()
@property (nonatomic, readwrite, assign) NSInteger statusCode;
@property (nonatomic, readwrite, assign) PNOperationType operation;
@property (nonatomic, readwrite, strong) PubNub *client;

@end

@implementation PNTTestResult

@synthesize actualResult = _actualResult;

- (instancetype)initWithClient:(PubNub *)client {
    NSParameterAssert(client);
    self = [super init];
    if (self) {
        _client = client;
    }
    return self;
}

- (instancetype)initResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType {
    self = [self initWithClient:client];
    if (self) {
        _statusCode = statusCode;
        _operation = operationType;
    }
    return self;
}

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType {
    return [[self alloc] initResultWithClient:client statusCode:statusCode operation:operationType];
}

- (PNResult *)actualResult {
    return _actualResult;
}

- (void)setActualResult:(PNResult *)actualResult {
    _actualResult = actualResult;
}

- (NSArray<NSString *> *)keysToAssert {
    return @[
             @"statusCode",
             @"operation",
             ];
}

+ (NSString *)PubNubClassName {
    NSString *testClassName = NSStringFromClass(self);
    return [testClassName stringByReplacingOccurrencesOfString:@"TTest" withString:@""];
}

+ (Class)PubNubClass {
    return NSClassFromString([self PubNubClassName]);
}

@end

@interface PNTTestHistoryResult ()
@property (nonatomic, strong, readwrite) NSNumber *start;
@property (nonatomic, strong, readwrite) NSNumber *end;
@property (nonatomic, strong, readwrite) NSArray *messages;
@end

@implementation PNTTestHistoryResult

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHistoryOperation];
    if (self) {
        _start = start;
        _end = end;
        _messages = messages;
    }
    return self;
}

+ (instancetype)successfulResultWithClient:(PubNub *)client start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    return [[self alloc] initHistoryResultWithClient:client statusCode:200 isError:NO start:start end:end messages:messages];
}

- (PNHistoryResult *)actualHistoryResult {
    return (PNHistoryResult *)self.actualResult;
}

- (void)setActualHistoryResult:(PNHistoryResult *)actualHistoryResult {
    self.actualResult = (PNResult *)actualHistoryResult;
}

- (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.start",
             @"data.end",
             @"data.messages",
             ];
}

@end

@interface PNTTestPresenceChannelHereNowResult ()
@property (nonatomic, strong, readwrite) id uuids;
@property (nonatomic, strong, readwrite) NSNumber *occupancy;

@end

@implementation PNTTestPresenceChannelHereNowResult

- (instancetype)initHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError uuids:(id)uuids occupancy:(NSNumber *)occupancy {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHereNowGlobalOperation];
    if (self) {
        _uuids = uuids;
        _occupancy = occupancy;
    }
    return self;
}

+ (instancetype)successfulHereNowResultWithClient:(PubNub *)client uuids:(id)uuids occupancy:(NSNumber *)occupancy {
    return [[self alloc] initHereNowResultWithClient:client statusCode:200 isError:NO uuids:uuids occupancy:occupancy];
}

- (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.occupancy",
             @"data.uuids",
             ];
}

- (void)setActualHereNowResult:(PNPresenceChannelHereNowResult *)actualHereNowResult {
    self.actualResult = (PNResult *)actualHereNowResult;
}

- (PNPresenceChannelHereNowResult *)actualHereNowResult {
    return (PNPresenceChannelHereNowResult *)self.actualResult;
}

@end
