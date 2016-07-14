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

- (instancetype)initHistoryResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;

+ (instancetype)successfulResultWithClient:(PubNub *)client start:(NSNumber *)start end:(NSNumber *)end messages:(NSArray *)messages;

@end

@interface PNTTestPresenceChannelHereNowResult : PNTTestResult
@property (nonatomic, strong, readonly) id uuids;
@property (nonatomic, strong, readonly) NSNumber *occupancy;
@property (nonatomic, strong) PNPresenceChannelHereNowResult *actualChannelHereNowResult;

- (instancetype)initChannelHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode uuids:(id)uuids occupancy:(NSNumber *)occupancy;
+ (instancetype)successfulChannelHereNowResultWithClient:(PubNub *)client uuids:(id)uuids occupancy:(NSNumber *)occupancy;

@end

@interface PNTTestPresenceGlobalHereNowResult : PNTTestResult
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSDictionary *> *channels;
@property (nonatomic, strong, readonly) NSNumber *totalChannels;
@property (nonatomic, strong, readonly) NSNumber *totalOccupancy;
@property (nonatomic, strong) PNPresenceGlobalHereNowResult *actualGlobalHereNowResult;

- (instancetype)initGlobalHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels;
+ (instancetype)successfulGlobalHereNowResultWithClient:(PubNub *)client channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels;

@end

@interface PNTTestPresenceChannelGroupHereNowResult : PNTTestResult
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSDictionary *> *channels;
@property (nonatomic, strong, readonly) NSNumber *totalChannels;
@property (nonatomic, strong, readonly) NSNumber *totalOccupancy;
@property (nonatomic, strong) PNPresenceChannelGroupHereNowResult *actualChannelGroupHereNowResult;

- (instancetype)initChannelGroupHereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels;
+ (instancetype)successfulChannelGroupHereNowResultWithClient:(PubNub *)client channels:(NSDictionary<NSString *, NSDictionary *> *)channels totalOccupancy:(NSNumber *)totalOccupancy totalChannels:(NSNumber *)totalChannels;
@end

@interface PNTTestPresenceWhereNowResult : PNTTestResult
@property (nonatomic, readonly, strong) NSArray<NSString *> *channels;
@property (nonatomic, strong) PNPresenceWhereNowResult *actualWhereNowResult;

- (instancetype)initWhereNowResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode channels:(NSArray<NSString *> *)channels;
+ (instancetype)successfulWhereNowResultWithClient:(PubNub *)client channels:(NSArray<NSString *> *)channels;

@end
