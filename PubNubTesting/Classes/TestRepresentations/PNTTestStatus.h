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
@property (nonatomic, strong, readonly) PNStatus *actualPubNubStatus;

- (instancetype)initStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError andPubNubStatus:(PNStatus *)pubNubStatus;

+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError andPubNubStatus:(PNStatus *)pubNubStatus;

@end

#pragma mark - Base Error Status Class (Abstract)

@interface PNTTestErrorStatus : PNTTestStatus

- (instancetype)initErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category andPubNubStatus:(PNErrorStatus *)pubNubErrorStatus;
+ (instancetype)errorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category andPubNubStatus:(PNErrorStatus *)pubNubErrorStatus;

@end

@interface PNTTestAcknowledgmentStatus : PNTTestErrorStatus

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError andPubNubStatus:(PNAcknowledgmentStatus *)pubNubAcknowledgmentStatus;
+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError andPubNubStatus:(PNAcknowledgmentStatus *)pubNubAcknowledgmentStatus;

@end
