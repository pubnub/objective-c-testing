//
//  XCTestCase+PNTHistory.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/13/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@interface XCTestCase (PNTHistory)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlock;

@end
