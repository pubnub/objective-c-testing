//
//  PNTTestAcknowledgmentStatus.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestErrorStatus.h"

@interface PNTTestAcknowledgmentStatus : PNTTestErrorStatus

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;
+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError;

+ (instancetype)channelGroupAddWithClient:(PubNub *)client;
+ (instancetype)channelGroupRemoveWithClient:(PubNub *)client;
+ (instancetype)channelGroupRemoveAllChannelsWithClient:(PubNub *)client;

@end
