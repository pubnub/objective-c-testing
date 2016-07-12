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

@end

#pragma mark - Base Acknowledgment Status Class (Abstract)

@interface PNTTestAcknowledgmentStatus : PNTTestErrorStatus

@property (nonatomic, strong) PNAcknowledgmentStatus *actualAcknowledgmentStatus;

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;
+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;

@end

@interface PNTTestPublishStatus : PNTTestAcknowledgmentStatus

@property (nonatomic, readonly, strong) NSNumber *timetoken;
@property (nonatomic, strong) PNPublishStatus *actualPublishStatus;

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken;
+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken;
+ (PNTTestPublishStatus *)failedStatusWithClient:(PubNub *)client;

@end
