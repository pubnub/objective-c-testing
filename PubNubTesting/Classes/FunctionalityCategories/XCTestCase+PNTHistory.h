//
//  XCTestCase+PNTHistory.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestHistoryResult;
@class PNTTestErrorStatus;

@interface XCTestCase (PNTHistory)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlockWithExpectedHistoryResult:(PNTTestHistoryResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus;

@end
