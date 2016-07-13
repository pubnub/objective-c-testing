//
//  PNTTestResult.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <PubNub/PubNub.h>
#import "PNTTestRepresentation.h"

@interface PNTTestResult : NSObject <PNTTestRepresentation>

@property (nonatomic, readonly, assign) NSInteger statusCode;
@property (nonatomic, readonly, assign) PNOperationType operation;

- (instancetype)initResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType;

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType;

@end

@interface PNTTestHistoryResult : PNTTestResult

@property (nonatomic, strong, readonly) NSNumber *start;
@property (nonatomic, strong, readonly) NSNumber *end;
@property (nonatomic, strong, readonly) NSArray *messages;
@property (nonatomic, strong) PNHistoryResult *actualHistoryResult;

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;

+ (instancetype)successfulResultWithClient:(PubNub *)client start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;

@end

@interface PNTTestPresenceChannelHereNowResult : PNTTestResult
@property (nonatomic, strong, readonly) id uuids;
@property (nonatomic, strong, readonly) NSNumber *occupancy;
@property (nonatomic, strong) PNPresenceChannelHereNowResult *actualHereNowResult;

- (instancetype)initHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError uuids:(id)uuids occupancy:(NSNumber *)occupancy;
+ (instancetype)successfulHereNowResultWithClient:(PubNub *)client uuids:(id)uuids occupancy:(NSNumber *)occupancy;

@end
