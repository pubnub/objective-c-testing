//
//  HistoryTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface HistoryTestCase : PNTClientTestCase

@end

@implementation HistoryTestCase

- (BOOL)isRecording {
    return NO;
}

- (void)testGetHistory {
    [self.client historyForChannel:self.historyChannel withCompletion:[self PNT_historyCompletionBlock]];
    [self waitFor:kPNTHistoryTimeout];
}

@end
