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

+ (NSArray<NSString *> *)keysToAssert {
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

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHistoryOperation];
    if (self) {
        _start = start;
        _end = end;
        _messages = messages;
    }
    return self;
}

+ (instancetype)successfulResultWithClient:(PubNub *)client start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages {
    return [[self alloc] initHistoryResultWithClient:client statusCode:200 start:start end:end messages:messages];
}

- (PNHistoryResult *)actualHistoryResult {
    return (PNHistoryResult *)self.actualResult;
}

- (void)setActualHistoryResult:(PNHistoryResult *)actualHistoryResult {
    self.actualResult = (PNResult *)actualHistoryResult;
}

+ (NSArray<NSString *> *)dataKeysToAssert {
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

- (instancetype)initChannelHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode uuids:(id)uuids occupancy:(NSNumber *)occupancy {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHereNowForChannelOperation];
    if (self) {
        _uuids = uuids;
        _occupancy = occupancy;
    }
    return self;
}

+ (instancetype)successfulChannelHereNowResultWithClient:(PubNub *)client uuids:(id)uuids occupancy:(NSNumber *)occupancy {
    return [[self alloc] initChannelHereNowResultWithClient:client statusCode:200 uuids:uuids occupancy:occupancy];
}

+ (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.occupancy",
             @"data.uuids",
             ];
}

- (void)setActualChannelHereNowResult:(PNPresenceChannelHereNowResult *)actualChannelHereNowResult {
    self.actualResult = (PNResult *)actualChannelHereNowResult;
}

- (PNPresenceChannelHereNowResult *)actualChannelHereNowResult {
    return (PNPresenceChannelHereNowResult *)self.actualResult;
}

@end

@interface PNTTestPresenceGlobalHereNowResult ()
@property (nonatomic, strong, readwrite) NSDictionary<NSString *, NSDictionary *> *channels;
@property (nonatomic, strong, readwrite) NSNumber *totalChannels;
@property (nonatomic, strong, readwrite) NSNumber *totalOccupancy;

@end

@implementation PNTTestPresenceGlobalHereNowResult

- (instancetype)initGlobalHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSDictionary<NSString *,NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHereNowGlobalOperation];
    if (self) {
        _totalChannels = totalChannels;
        _channels = channels;
        _totalOccupancy = totalOccupancy;
    }
    return self;
}

+ (instancetype)successfulGlobalHereNowResultWithClient:(PubNub *)client channels:(NSDictionary<NSString *,NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels {
    return [[self alloc] initGlobalHereNowResultWithClient:client statusCode:200 channels:channels totalOccupancy:totalOccupancy totalChannels:totalChannels];
}

+ (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.channels",
             @"data.totalChannels",
             @"data.totalOccupancy",
             ];
}

- (void)setActualGlobalHereNowResult:(PNPresenceGlobalHereNowResult *)actualGlobalHereNowResult {
    self.actualResult = (PNResult *)actualGlobalHereNowResult;
}

- (PNPresenceGlobalHereNowResult *)actualGlobalHereNowResult {
    return (PNPresenceGlobalHereNowResult *)self.actualResult;
}

@end

@interface PNTTestPresenceChannelGroupHereNowResult ()
@property (nonatomic, strong, readwrite) NSDictionary<NSString *, NSDictionary *> *channels;
@property (nonatomic, strong, readwrite) NSNumber *totalChannels;
@property (nonatomic, strong, readwrite) NSNumber *totalOccupancy;
@end

@implementation PNTTestPresenceChannelGroupHereNowResult

- (instancetype)initChannelGroupHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNHereNowForChannelGroupOperation];
    if (self) {
        _channels = channels;
        _totalChannels = totalChannels;
        _totalOccupancy = totalOccupancy;
    }
    return self;
}

+ (instancetype)successfulChannelGroupHereNowResultWithClient:(PubNub *)client channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels {
    return [[self alloc] initChannelGroupHereNowResultWithClient:client statusCode:200 channels:channels totalOccupancy:totalOccupancy totalChannels:totalChannels];
}

- (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.channels",
             @"data.totalChannels",
             @"data.totalOccupancy",
             ];
}

- (void)setActualChannelGroupHereNowResult:(PNPresenceChannelGroupHereNowResult *)actualChannelGroupHereNowResult {
    self.actualResult = (PNResult *)actualChannelGroupHereNowResult;
}

- (PNPresenceChannelGroupHereNowResult *)actualChannelGroupHereNowResult {
    return (PNPresenceChannelGroupHereNowResult *)self.actualResult;
}

@end

@interface PNTTestPresenceWhereNowResult ()
@property (nonatomic, strong, readwrite) NSArray<NSString *> *channels;
@end

@implementation PNTTestPresenceWhereNowResult

- (instancetype)initWhereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSArray<NSString *> *)channels {
    self = [super initResultWithClient:client statusCode:statusCode operation:PNWhereNowOperation];
    if (self) {
        _channels = channels;
    }
}
+ (instancetype)successfulWhereNowResultWithClient:(PubNub *)client channels:(NSArray<NSString *> *)channels {
    return [[self alloc] initWhereNowResultWithClient:client statusCode:200 channels:channels];
}

- (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.channels",
             ];
}

- (void)setActualWhereNowResult:(PNPresenceWhereNowResult *)actualWhereNowResult {
    self.actualResult = (PNResult *)actualWhereNowResult;
}

- (PNPresenceWhereNowResult *)actualWhereNowResult {
    return (PNPresenceWhereNowResult *)self.actualResult;
}

@end


