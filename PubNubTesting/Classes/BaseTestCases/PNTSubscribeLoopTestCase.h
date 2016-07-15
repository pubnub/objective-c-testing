//
//  PNTSubscribeLoopTestCase.h
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import "PNTClientChannelGroupTestCase.h"

@interface PNTSubscribeLoopTestCase : PNTClientChannelGroupTestCase <PNObjectEventListener>

// these are properties so that they can be easily accessed with dot accessors with compiler autocomplete
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSNumber *> *subscribedChannels; // default is empty array, keys are channels, values are numbers should be wrapped BOOLs, `YES` is presence, `NO` is no presence
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSNumber *> *subscribedChannelGroups; // default is empty array, keys are channel groups, values are numbers should be wrapped BOOLs, `YES` is presence, `NO` is no presence
@property (nonatomic, assign, readonly) BOOL shouldRunSubscribeSetUp; // default is `YES`
@property (nonatomic, assign, readonly) BOOL shouldRunSubscribeTearDown; // default is `YES`

@end
