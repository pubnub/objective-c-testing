//
//  XCTestCase+PNTPublish.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <XCTest/XCTest.h>

@class PNPublishStatus;
@class PNTTestPublishStatus;

@interface XCTestCase (PNTPublish)

- (PNPublishCompletionBlock)PNT_completionWithExpectedPublishStatus:(PNTTestPublishStatus *)expectedPublishStatus;

@end
