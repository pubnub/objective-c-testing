//
//  XCTestCase+PNTChannelGroup.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/4/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestAcknowledgmentStatus;

@interface XCTestCase (PNTChannelGroup)

//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupAdd;
//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveSomeChannels;
//- (PNGroupChannelsAuditCompletionBlock)PNT_channelGroupAudit;
//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveAllChannels;

- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupChangeCompletionBlockWithResult:(PNTTestAcknowledgmentStatus *)expectedStatus;
- (void)PNT_removeChannelGroup:(NSString *)channelGroup forClient:(PubNub *)client;
- (void)PNT_addChannels:(NSArray<NSString *> *)channels toGroup:(NSString *)channelGroup forClient:(PubNub *)client;

@end
