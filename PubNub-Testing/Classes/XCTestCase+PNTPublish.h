//
//  XCTestCase+PNTPublish.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <XCTest/XCTest.h>

@class PNPublishStatus;

@interface XCTestCase (PNTPublish)

- (void)PNT_assertOnPublishStatus:(PNPublishStatus *)status withSuccess:(BOOL)isSuccessful;

- (PNPublishCompletionBlock)PNT_successfulPublishCompletionWithExpectedTimeToken:(NSNumber *)timeToken;
- (PNPublishCompletionBlock)PNT_failedPublishCompletion;

@end
