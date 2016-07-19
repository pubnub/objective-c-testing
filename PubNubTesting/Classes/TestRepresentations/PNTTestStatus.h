//
//  PNTTestStatus.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "PNTTestResult.h"

#pragma mark - Base Status Class (Abstract)

@interface PNTTestStatus : PNTTestResult

@property (nonatomic, readonly, assign) PNStatusCategory category;
@property (nonatomic, readonly, assign, getter = isError) BOOL error;
@property (nonatomic, strong) PNStatus *actualStatus;

- (instancetype)initStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;

+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;

@end

#pragma mark - Base Error Status Class (Abstract)

@interface PNTTestErrorStatus : PNTTestStatus

@property (nonatomic, strong) PNErrorStatus *actualErrorStatus;

- (instancetype)initErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;
+ (instancetype)errorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;

#pragma mark - Failed
+ (instancetype)failedErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category;
+ (instancetype)failedBadRequestStatusWithClient:(PubNub *)client operation:(PNOperationType)operationType;


@end

#pragma mark - Base Acknowledgment Status Class (Abstract)

@interface PNTTestAcknowledgmentStatus : PNTTestErrorStatus

@property (nonatomic, strong) PNAcknowledgmentStatus *actualAcknowledgmentStatus;

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;
+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;

#pragma mark - Channel Groups
+ (instancetype)successfulChannelGroupAddWithClient:(PubNub *)client;
+ (instancetype)successfulChannelGroupRemoveWithClient:(PubNub *)client;
+ (instancetype)successfulChannelGroupRemoveAllChannelsWithClient:(PubNub *)client;

@end

@interface PNTTestPublishStatus : PNTTestAcknowledgmentStatus

@property (nonatomic, readonly, strong) NSNumber *timetoken;
@property (nonatomic, strong) PNPublishStatus *actualPublishStatus;

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken;
+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken;
+ (PNTTestPublishStatus *)failedStatusWithClient:(PubNub *)client;

@end

@interface PNTTestClientStateUpdateStatus : PNTTestErrorStatus
@property (nonatomic, readonly, strong) NSDictionary<NSString *, id> *state;
@property (nonatomic, strong) PNClientStateUpdateStatus *actualClientStateUpdateStatus;

- (instancetype)initClientStateUpdateStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError state:(NSDictionary<NSString *, id> *)state;
+ (instancetype)successfulClientStateUpdateStatusWithClient:(PubNub *)client state:(NSDictionary<NSString *, id> *)state;

@end

@interface PNTTestSubscribeStatus : PNTTestErrorStatus

@property (nonatomic, nullable, readonly, strong) NSString *subscribedChannel;

@property (nonatomic, nullable, readonly, strong) NSString *actualChannel;
@property (nonatomic, readonly, strong) NSNumber *timetoken;
@property (nonatomic, strong) PNSubscribeStatus *actualSubscribeStatus;

- (instancetype)initSubscribeStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode category:(PNStatusCategory)category isError:(BOOL)isError subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken;
+ (instancetype)subscribeStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode category:(PNStatusCategory)category isError:(BOOL)isError subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken;
+ (instancetype)successfulSubscribeStatusWithClient:(PubNub *)client subscribedChannel:(NSString *)subscribedChannel actualChannel:(NSString *)actualChannel timeToken:(NSNumber *)timeToken;

@end
