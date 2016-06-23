//
//  PNTTestPublishStatus.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestAcknowledgmentStatus.h"

@interface PNTTestPublishStatus : PNTTestAcknowledgmentStatus

@property (nonatomic, readonly, strong) NSNumber *timetoken;

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken;
+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken;
+ (PNTTestPublishStatus *)failedStatusWithClient:(PubNub *)client;

@end
