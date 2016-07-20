//
//  PNTTestStatus.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "PNTTestStatus.h"

@interface PNTTestStatus ()
@property (nonatomic, readwrite, assign) PNStatusCategory category;
@property (nonatomic, readwrite, assign, getter = isError) BOOL error;

@end

@implementation PNTTestStatus

- (instancetype)initStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    self = [super initResultWithClient:client statusCode:statusCode operation:operationType];
    if (self) {
        _category = category;
        _error = isError;
    }
    return self;
}

+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    return [[self alloc] initStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:isError];
}

+ (NSArray<NSString *> *)keysToAssert {
    NSMutableArray *superKeys = [super keysToAssert].mutableCopy;
    [superKeys addObjectsFromArray:@[
                                     @"category",
                                     @"error"
                                     ]];
    return superKeys.copy;
}

- (PNStatus *)actualStatus {
    return (PNStatus *)self.actualResult;
}

- (void)setActualStatus:(PNStatus *)actualStatus {
    self.actualResult = (PNResult *)actualStatus;
}

@end

@implementation PNTTestErrorStatus

- (instancetype)initErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    self = [super initStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:isError];
    return self;
}

+ (instancetype)errorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    return [[self alloc] initErrorStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:isError];
}

- (PNErrorStatus *)actualErrorStatus {
    return (PNErrorStatus *)self.actualStatus;
}

- (void)setActualErrorStatus:(PNErrorStatus *)actualErrorStatus {
    self.actualStatus = (PNStatus *)actualErrorStatus;
}

#pragma mark - Failed

+ (instancetype)failedErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category {
    return [self errorStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:YES];
}

+ (instancetype)failedBadRequestStatusWithClient:(PubNub *)client operation:(PNOperationType)operationType {
    return [self failedErrorStatusWithClient:client statusCode:400 operation:operationType category:PNBadRequestCategory];
}

@end

@implementation PNTTestAcknowledgmentStatus

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError {
    self = [super initErrorStatusWithClient:client statusCode:statusCode operation:operationType category:PNAcknowledgmentCategory isError:NO];
    return self;
}

+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError {
    return [[self alloc] initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:operationType isError:isError];
}

- (PNAcknowledgmentStatus *)actualAcknowledgmentStatus {
    return (PNAcknowledgmentStatus *)self.actualErrorStatus;
}

- (void)setActualAcknowledgmentStatus:(PNAcknowledgmentStatus *)actualAcknowledgmentStatus {
    self.actualErrorStatus = (PNErrorStatus *)actualAcknowledgmentStatus;
}

#pragma mark - Channel Groups

+ (instancetype)successfulChannelGroupAddWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNAddChannelsToGroupOperation isError:NO];
}

+ (instancetype)successfulChannelGroupRemoveWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNRemoveChannelsFromGroupOperation isError:NO];
}

+ (instancetype)successfulChannelGroupRemoveAllChannelsWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNRemoveGroupOperation isError:NO];
}

@end

@interface PNTTestPublishStatus ()
@property (nonatomic, readwrite, strong) NSNumber *timetoken;
@end

@implementation PNTTestPublishStatus

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken {
    self = [super initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:PNPublishOperation isError:isError];
    if (self) {
        _timetoken = timeToken;
    }
    return self;
}

+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken {
    return [[self alloc] initPublishStatusWithClient:client statusCode:200 isError:NO timeToken:timeToken];
}

+ (PNTTestPublishStatus *)failedStatusWithClient:(PubNub *)client {
    return (PNTTestPublishStatus *)[PNTTestErrorStatus failedBadRequestStatusWithClient:client operation:PNPublishOperation];
}

+ (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.timetoken"
             ];
}

- (PNPublishStatus *)actualPublishStatus {
    return (PNPublishStatus *)self.actualErrorStatus;
}

- (void)setActualPublishStatus:(PNPublishStatus *)actualPublishStatus {
    self.actualAcknowledgmentStatus = (PNAcknowledgmentStatus *)actualPublishStatus;
}

@end

@interface PNTTestClientStateUpdateStatus ()
@property (nonatomic, readwrite, strong) NSDictionary<NSString *, id> *state;
@end

@implementation PNTTestClientStateUpdateStatus

- (instancetype)initClientStateUpdateStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError state:(NSDictionary<NSString *, id> *)state {
    self = [super initErrorStatusWithClient:client statusCode:statusCode operation:PNSetStateOperation category:PNAcknowledgmentCategory isError:isError];
    if (self) {
        _state = state;
    }
    return self;
}

+ (instancetype)successfulClientStateUpdateStatusWithClient:(PubNub *)client state:(NSDictionary<NSString *, id> *)state {
    return [[self alloc] initClientStateUpdateStatusWithClient:client statusCode:200 isError:NO state:state];
}

+ (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.state"
             ];
}

- (PNClientStateUpdateStatus *)actualClientStateUpdateStatus {
    return (PNClientStateUpdateStatus *)self.actualErrorStatus;
}

- (void)setActualClientStateUpdateStatus:(PNClientStateUpdateStatus *)actualClientStateUpdateStatus {
    self.actualErrorStatus = (PNErrorStatus *)actualClientStateUpdateStatus;
}

@end

@interface PNTTestSubscribeStatus ()
@property (nonatomic, nullable, readwrite, strong) NSString *subscribedChannel;

@property (nonatomic, nullable, readwrite, strong) NSString *actualChannel;
@property (nonatomic, readwrite, strong) NSNumber *timetoken;
@end

@implementation PNTTestSubscribeStatus

- (instancetype)initSubscribeStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode category:(PNStatusCategory)category isError:(BOOL)isError subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken {
    self = [super initErrorStatusWithClient:client statusCode:statusCode operation:PNSubscribeOperation category:category isError:isError];
    if (self) {
        _subscribedChannel = subscribedChannel;
        _actualChannel = actualChannel;
        _timetoken = timeToken;
    }
    return self;
}

+ (instancetype)subscribeStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode category:(PNStatusCategory)category isError:(BOOL)isError subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken {
    return [[self alloc] initSubscribeStatusWithClient:client statusCode:statusCode category:category isError:isError subscribedChannel:subscribedChannel actualChannel:actualChannel timeToken:timeToken];
}

+ (instancetype)successfulSubscribeStatusWithClient:(PubNub *)client subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken {
    return [self subscribeStatusWithClient:client statusCode:200 category:PNConnectedCategory isError:NO subscribedChannel:subscribedChannel actualChannel:actualChannel timeToken:timeToken];
}

- (void)setActualSubscribeStatus:(PNSubscribeStatus *)actualSubscribeStatus {
    self.actualStatus = (PNStatus *)actualSubscribeStatus;
}

- (PNSubscribeStatus *)actualSubscribeStatus {
    return (PNSubscribeStatus *)self.actualStatus;
}

+ (NSArray<NSString *> *)dataKeysToAssert {
    return @[
             @"data.subscribedChannel",
             @"data.actualChannel",
             @"data.timetoken",
             ];
}

@end
