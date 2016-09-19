//
//  XCTestCase+PNTChannelGroup.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestAcknowledgmentStatus;

@interface XCTestCase (PNTChannelGroup)

- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupChangeCompletionBlockWithResult:(PNTTestAcknowledgmentStatus *)expectedStatus;
- (void)PNT_removeChannelGroup:(NSString *)channelGroup forClient:(PubNub *)client;
- (void)PNT_addChannels:(NSArray<NSString *> *)channels toGroup:(NSString *)channelGroup forClient:(PubNub *)client;

@end
