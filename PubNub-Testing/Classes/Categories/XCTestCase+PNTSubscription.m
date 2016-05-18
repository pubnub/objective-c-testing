//
//  XCTestCase+PNTSubscription.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/5/16.
//
//

#import "XCTestCase+PNTSubscription.h"
#import "PNTTestSubscribeStatus.h"
#import "PNTTestSubscriberResults.h"

//@interface PNTTestSubscribeStatus ()
//@property (nonatomic, strong, readwrite) PubNub *client;
//@property (nonatomic, strong, readwrite) NSNumber *timeToken;
//@property (nonatomic, strong, readwrite) NSArray<NSString *> *expectedChannels;
//@property (nonatomic, strong, readwrite) NSArray<NSString *> *expectedChannelGroups;
//@property (nonatomic, assign, readwrite) PNOperationType expectedOperation;
//@property (nonatomic, assign, readwrite) PNStatusCategory expectedStatusCategory;
//@property (nonatomic, assign, readwrite) PNTTestSubscribeComparisonType comparisonType;
//@end
//
//@implementation PNTTestSubscribeStatus
//
//- (instancetype)initWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedOperation:(PNOperationType)operation expectedCategory:(PNStatusCategory)category expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups comparisonType:(PNTTestSubscribeComparisonType)comparisonType {
//    self = [super init];
//    if (self) {
//        _client = client;
//        _timeToken = timeToken;
//        _expectedChannels = channels;
//        _expectedChannelGroups = channelGroups;
//        _expectedOperation = operation;
//        _expectedStatusCategory = category;
//        _comparisonType = comparisonType;
//    }
//    return self;
//}
//
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels comparisonType:(PNTTestSubscribeComparisonType)comparisonType{
//    return [self expectedConnectStatusWithClient:client expectedTimeToken:timeToken expectedChannels:channels expectedChannelGroups:nil comparisonType:comparisonType];
//}
//
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannelGroups:(NSArray<NSString *> *)channelGroups comparisonType:(PNTTestSubscribeComparisonType)comparisonType{
//    return [self expectedConnectStatusWithClient:client expectedTimeToken:timeToken expectedChannels:nil expectedChannelGroups:channelGroups comparisonType:comparisonType];
//}
//
//+ (instancetype)expectedConnectStatusWithClient:(PubNub *)client expectedTimeToken:(NSNumber *)timeToken expectedChannels:(NSArray<NSString *> *)channels expectedChannelGroups:(NSArray<NSString *> *)channelGroups comparisonType:(PNTTestSubscribeComparisonType)comparisonType{
//    return [[self alloc] initWithClient:client expectedTimeToken:timeToken expectedOperation:PNSubscribeOperation expectedCategory:PNConnectedCategory expectedChannels:channels expectedChannelGroups:channelGroups comparisonType:comparisonType];
//}
//
//- (NSSet<NSString *> *)expectedChannelsSet {
//    return [NSSet setWithArray:self.expectedChannels];
//}
//
//- (NSSet<NSString *> *)expectedChannelGroupsSet {
//    return [NSSet setWithArray:self.expectedChannelGroups];
//}
//
//@end

@implementation XCTestCase (PNTSubscription)

- (void)PNT_successfulSubscribeWithExpectedResult:(PNTTestSubscribeStatus *)expectedResult andActualStatus:(PNSubscribeStatus *)subscribeStatus withComparisonType:(PNTTestSubscribeComparisonType)comparisonType {
//    XCTAssertNotNil(expectedResult);
//    XCTAssertNotNil(subscribeStatus);
//    XCTAssertNotNil(expectedResult.client);
//    // now do time tokens
//    XCTAssertNotNil(expectedResult.timeToken);
//    XCTAssertNotNil(subscribeStatus.data.timetoken);
//    XCTAssertEqualObjects(expectedResult.timeToken, subscribeStatus.data.timetoken);
//    // now compare operation and status category
//    XCTAssertEqual(expectedResult.expectedOperation, PNSubscribeOperation);
//    XCTAssertEqual(expectedResult.expectedStatusCategory, PNConnectedCategory);
//    // now assert on channels and/or channel groups
//    switch (comparisonType) {
//        case PNTTestSubscribeComparisonTypeContains:
//        {
//            
//        }
//            break;
//        case PNTTestSubscribeComparisonTypeMatchExactly:
//        {
//            
////            XCTAssertEqualObjects(expectedResult.expectedChannelsSet, [NSSet setWithArray:])
//        }
//            break;
//    }
}

- (void)PNT_successfulMessageWithExpectedMessage:(PNTTestMessageResult *)expectedResult andActualMessage:(PNMessageResult *)message {
    
}

- (void)PNT_successfulPresenceEventWithExpectedEvent:(PNTTestPresenceEventResult *)expectedResult andActualEvent:(PNPresenceEventResult *)result {
    
}

//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannels:(NSArray<NSString *> *)channels {
////    XCTAssertNotNil(client);
////    XCTAssertNotNil(status);
////    XCTAssertFalse(status.isError);
////    XCTAssertEqual(status.category, PNConnectedCategory);
////    XCTAssertEqual(status.operation, PNSubscribeOperation);
////    XCTAssertEqual(status.statusCode, 200);
////    XCTAssertTrue([status isKindOfClass:[PNSubscribeStatus class]]);
////    PNSubscribeStatus *subscribeStatus = (PNSubscribeStatus *)status;
////    return YES;
//}
//
//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannelGroups:(NSArray<NSString *> *)channelGroups {
//    return [self _successfulSubscriptionWithComparisonType:comparisonType forClient:client withStatus:status forSubscribables:channelGroups];
//}
//
//- (BOOL)PN_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forChannels:(NSArray<NSString *> *)channels andChannelGroups:(NSArray<NSString *> *)channelGroups {
//    return (
//            ([self PN_successfulSubscriptionWithComparisonType:comparisonType forClient:client withStatus:status forChannels:channels]) &&
//            ([self PN_successfulSubscriptionWithComparisonType:comparisonType forClient:client withStatus:status forChannelGroups:channelGroups])
//            );
//}
//
//- (BOOL)_successfulSubscriptionWithComparisonType:(PNTestSubscribeComparisonType)comparisonType forClient:(PubNub *)client withStatus:(PNStatus *)status forSubscribables:(NSArray<NSString *> *)subscribables {
//    if (!subscribables) {
//        return NO;
//    }
//    return NO;
//}

@end
