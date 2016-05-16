//
//  XCTestCase+PNTSubscription.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/5/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

typedef NS_ENUM(NSUInteger, PNTTestSubscribeComparisonType) {
    PNTTestSubscribeComparisonTypeMatchExactly,
    PNTTestSubscribeComparisonTypeContains,
};

@interface PNTTestSubscribeStatus : NSObject
@property (nonatomic, strong, readonly) PubNub *client;
@property (nonatomic, strong, readonly) NSNumber *timeToken;
@property (nonatomic, strong, readonly) NSArray<NSString *> *expectedChannels;
@property (nonatomic, strong, readonly) NSArray<NSString *> *expectedChannelGroups;
@property (nonatomic, assign, readonly) PNOperationType expectedOperation;
@property (nonatomic, assign, readonly) PNStatusCategory expectedStatusCategory;
@property (nonatomic, assign, readonly) NSSet<NSString *> *expectedChannelsSet;
@property (nonatomic, assign, readonly) NSSet<NSString *> *expectedChannelGroupsSet;
//@property (nonatomic, strong) PNStatus *actualStatus;
@property (nonatomic, assign, readonly) PNTTestSubscribeComparisonType comparisonType;

- (instancetype)initWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedOperation:(PNOperationType)operation expectedCategory:(PNStatusCategory)category expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups;
+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels;
+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannelGroups:(NSArray<NSString *> *)channelGroups;
+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups;

//- (instancetype)initWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channels:(NSArray<NSString *> *)expectedChannels timeToken:(NSNumber *)timeToken;
//- (instancetype)initWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channelGroups:(NSArray<NSString *> *)expectedChannelGroups timeToken:(NSNumber *)timeToken;
//- (instancetype)initWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channels:(NSArray<NSString *> *)expectedChannels channelGroups:(NSArray<NSString *> *)expectedChannelGroups timeToken:(NSNumber *)timeToken;
//+ (instancetype)subscribeResultWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channels:(NSArray<NSString *> *)expectedChannels timeToken:(NSNumber *)timeToken;
//+ (instancetype)subscribeResultWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channelGroups:(NSArray<NSString *> *)expectedChannelGroups timeToken:(NSNumber *)timeToken;
//+ (instancetype)subscribeResultWithComparisonType:(PNTestSubscribeComparisonType)comparisonType client:(PubNub *)client status:(PNStatus *)actualStatus channels:(NSArray<NSString *> *)expectedChannels channelGroups:(NSArray<NSString *> *)expectedChannelGroups timeToken:(NSNumber *)timeToken;

@end

@interface PNTTestMessageResult : NSObject

@end

@interface PNTTestPresenceResult : NSObject

@end

/**
 *  Root class for comparing all sorts of things
 */
@interface PNTTestEvent : NSObject
@property (nonatomic, strong, readonly) PubNub *client;
@property (nonatomic, assign, readonly) PNOperationType expectedOperation;
@property (nonatomic, assign, readonly) PNStatusCategory expectedStatusCategory;

@end

@interface XCTestCase (PNTSubscription)

- (void)PNT_successfulSubscribeWithExpectedResult:(PNTTestSubscribeStatus *)expectedResult andActualStatus:(PNSubscribeStatus *)subscribeStatus withComparisonType:(PNTTestSubscribeComparisonType)comparisonType;
- (void)PNT_successfulMessageWithExpectedMessage:(PNTTestMessageResult *)expectedResult andActualMessage:(PNMessageResult *)message;
- (void)PNT_successfulPresenceEventWithExpectedEvent:(PNTTestPresenceResult *)expectedResult andActualEvent:(PNPresenceEventResult *)result;

//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannels:(NSArray<NSString *> *)channels;
//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannelGroups:(NSArray<NSString *> *)channelGroups;
//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannels:(NSArray<NSString *> *)channels andChannelGroups:(NSArray<NSString *> *)channelGroups;

@end
