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
@class PNTTestErrorStatus;

@interface XCTestCase (PNTPresence)

- (PNHereNowCompletionBlock)PNT_hereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

@end
