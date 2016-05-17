//
//  PNTSubscribeLoopTestCase.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/21/16.
//
//

#import "PNTClientTestCase.h"

typedef void (^PNTClientDidReceiveStatusHandler)(PubNub *client, PNStatus *status);
typedef void (^PNTClientDidReceiveMessageHandler)(PubNub *client, PNMessageResult *message);
typedef void (^PNTClientDidReceivePresenceEventHandler)(PubNub *client, PNPresenceEventResult *event);

@class PNTTestSubscribeStatus;
@class PNTTestMessageResult;
@class PNTTestPresenceResult;

@interface PNTSubscribeLoopTestCase : PNTClientTestCase <PNObjectEventListener>

@property (nonatomic, copy) PNTClientDidReceiveStatusHandler didReceiveStatusHandler;
@property (nonatomic, copy) PNTClientDidReceiveMessageHandler didReceiveMessageHandler;
@property (nonatomic, copy) PNTClientDidReceivePresenceEventHandler didReceivePresenceEventHandler;

@property (nonatomic, strong) NSArray<PNTTestSubscribeStatus *> *expectedSubscribeStatuses;
@property (nonatomic, strong) NSArray<PNTTestMessageResult *> *expectedMessageResults;
@property (nonatomic, strong) NSArray<PNTTestPresenceResult *> *expectedPresenceResults;

// these are properties so that they can be easily accessed with dot accessors with compiler autocomplete
@property (nonatomic, strong, readonly) NSArray<NSString *> *subscribedChannels; // default is empty array
@property (nonatomic, strong, readonly) NSArray<NSString *> *subscribedChannelGroups; // default is empty array
@property (nonatomic, assign, readonly) BOOL shouldSubscribeWithPresence; // default is `NO`
@property (nonatomic, assign, readonly) BOOL shouldRunSetUp; // default is `YES`
@property (nonatomic, assign, readonly) BOOL shouldrunTearDown; // default is `YES`

- (BOOL)expectedSubscribeChannelsMatches:(NSArray<NSString *> *)actualChannels; // this checks if presence is yes or no and includes those in assert
- (BOOL)expectedSubscribeChannelGroupsMatches:(NSArray<NSString *> *)actualChannelGroups; // this checks if presence is yes or no and includes those in assert
- (BOOL)expectedAllSubscriptionsMatchesChannels:(NSArray<NSString *> *)actualChannels andChannelGroups:(NSArray<NSString *> *)actualChannelGroups; // this checks if presence is yes or no and includes those in assert
- (NSArray<NSString *> *)expectedChannelsForChannelGroup:(NSString *)channelGroup; // this is implemented, usually with a big if else statement to determine what channels are added to a channel group during setUp, this is skipped if shouldRunSetUp is NO, if subscribedChannelGroups has no objects then this is not called

@end
