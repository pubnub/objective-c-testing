//
//  XCTestCase+PNTPresence.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestPresenceChannelHereNowResult;
@class PNTTestPresenceChannelGroupHereNowResult;
@class PNTTestPresenceWhereNowResult;
@class PNTTestPresenceGlobalHereNowResult;
@class PNTTestErrorStatus;

@interface XCTestCase (PNTPresence)

- (PNHereNowCompletionBlock)PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

- (PNGlobalHereNowCompletionBlock)PNT_globalHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceGlobalHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

- (PNChannelGroupHereNowCompletionBlock)PNT_channelGroupHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelGroupHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

- (PNWhereNowCompletionBlock)PNT_whereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceWhereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

@end
