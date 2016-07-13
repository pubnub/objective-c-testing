//
//  XCTestCase+PNTPresence.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@interface XCTestCase (PNTPresence)

- (PNHereNowCompletionBlock)PNT_hereNowCompletionBlockWithExpectedHereNowResult:(PNT)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlockWithExpectedHistoryResult:(PNTTestHistoryResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

@end
