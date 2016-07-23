//
//  PNTSubscribeLoopTestCase.h
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import "PNTClientChannelGroupTestCase.h"
#import "PNTTestStack.h"

@class PNTTestSubscribeStatus;
@class PNTTestMessageResult;

typedef void (^PNTClientDidReceiveStatusHandler)(PubNub *client, PNStatus *status);
typedef void (^PNTClientDidReceiveMessageHandler)(PubNub *client, PNMessageResult *message);
typedef void (^PNTClientDidReceivePresenceEventHandler)(PubNub *client, PNPresenceEventResult *event);

@interface PNTSubscribeLoopTestCase : PNTClientChannelGroupTestCase <PNObjectEventListener>

// these are properties so that they can be easily accessed with dot accessors with compiler autocomplete
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSNumber *> *subscribedChannels; // default is empty array, keys are channels, values are numbers should be wrapped BOOLs, `YES` is presence, `NO` is no presence
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSNumber *> *subscribedChannelGroups; // default is empty array, keys are channel groups, values are numbers should be wrapped BOOLs, `YES` is presence, `NO` is no presence
@property (nonatomic, assign, readonly) BOOL shouldRunSubscribeSetUp; // default is `YES`
@property (nonatomic, assign, readonly) BOOL shouldRunSubscribeTearDown; // default is `YES`

@property (nonatomic, strong, readonly) PNTTestStack<PNTTestSubscribeStatus *> *expectedSubscribeStatuses;
@property (nonatomic, strong, readonly) PNTTestStack<PNTTestMessageResult *> *expectedMessages;
@property (nonatomic, strong, readonly) NSArray<PNTTestSubscribeStatus *> *setUpSubscribeStatuses;
@property (nonatomic, strong, readonly) NSArray<PNTTestSubscribeStatus *> *tearDownSubscribeStatuses;

@property (nonatomic, copy) PNTClientDidReceiveStatusHandler didReceiveStatusHandler;
@property (nonatomic, copy) PNTClientDidReceiveMessageHandler didReceiveMessageHandler;
@property (nonatomic, copy) PNTClientDidReceivePresenceEventHandler didReceivePresenceEventHandler;

- (BOOL)shouldFailIfExtraExpectedSubscribeStatusesBeforeTearDown; // default is YES

@end
