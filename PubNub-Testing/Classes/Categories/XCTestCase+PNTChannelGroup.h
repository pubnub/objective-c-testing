//
//  XCTestCase+PNTChannelGroup.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/4/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@interface XCTestCase (PNTChannelGroup)

- (PNChannelGroupChangeCompletionBlock)PNT_ccompletionWith;
- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveSomeChannels;
- (PNGroupChannelsAuditCompletionBlock)PNT_channelGroupAudit;
- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveAllChannels;

@end
