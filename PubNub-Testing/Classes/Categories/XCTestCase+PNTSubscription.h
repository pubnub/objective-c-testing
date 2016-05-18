//
//  XCTestCase+PNTSubscription.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/5/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>
#import "PNTTestConstants.h"

//typedef NS_ENUM(NSUInteger, PNTTestSubscribeComparisonType) {
//    PNTTestSubscribeComparisonTypeMatchExactly,
//    PNTTestSubscribeComparisonTypeContains,
//};
//
//@interface PNTTestSubscribeStatus : NSObject
//@property (nonatomic, strong, readonly) PubNub *client;
//@property (nonatomic, strong, readonly) NSNumber *timeToken;
//@property (nonatomic, strong, readonly) NSArray<NSString *> *expectedChannels;
//@property (nonatomic, strong, readonly) NSArray<NSString *> *expectedChannelGroups;
//@property (nonatomic, assign, readonly) PNOperationType expectedOperation;
//@property (nonatomic, assign, readonly) PNStatusCategory expectedStatusCategory;
//@property (nonatomic, assign, readonly) NSSet<NSString *> *expectedChannelsSet;
//@property (nonatomic, assign, readonly) NSSet<NSString *> *expectedChannelGroupsSet;
//@property (nonatomic, assign, readonly) PNTTestSubscribeComparisonType comparisonType;
//
//- (instancetype)initWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedOperation:(PNOperationType)operation expectedCategory:(PNStatusCategory)category expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups comparisonType:(PNTTestSubscribeComparisonType)comparisonType;
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels comparisonType:(PNTTestSubscribeComparisonType)comparisonType;
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannelGroups:(NSArray<NSString *> *)channelGroups comparisonType:(PNTTestSubscribeComparisonType)comparisonType;
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups;
//
//@end
//
//@interface PNTTestMessageResult : NSObject
//
//@end
//
//@interface PNTTestPresenceResult : NSObject
//
//@end
//
/////**
//// *  Root class for comparing all sorts of things
//// */
////@interface PNTTestEvent : NSObject
////@property (nonatomic, strong, readonly) PubNub *client;
////@property (nonatomic, assign, readonly) PNOperationType expectedOperation;
////@property (nonatomic, assign, readonly) PNStatusCategory expectedStatusCategory;
////
////@end

@class PNTTestSubscribeStatus;
@class PNTTestMessageResult;
@class PNTTestPresenceEventResult;

@interface XCTestCase (PNTSubscription)

- (void)PNT_successfulSubscribeWithExpectedResult:(PNTTestSubscribeStatus *)expectedResult andActualStatus:(PNSubscribeStatus *)subscribeStatus withComparisonType:(PNTTestSubscribeComparisonType)comparisonType;
- (void)PNT_successfulMessageWithExpectedMessage:(PNTTestMessageResult *)expectedMessage andActualMessage:(PNMessageResult *)message;
- (void)PNT_successfulPresenceEventWithExpectedEvent:(PNTTestPresenceEventResult *)expectedPresence andActualEvent:(PNPresenceEventResult *)result;

@end
