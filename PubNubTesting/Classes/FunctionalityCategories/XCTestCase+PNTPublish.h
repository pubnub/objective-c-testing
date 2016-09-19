//
//  XCTestCase+PNTPublish.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestPublishStatus;

@interface XCTestCase (PNTPublish)

- (PNPublishCompletionBlock)PNT_completionWithExpectedPublishStatus:(PNTTestPublishStatus *)expectedPublishStatus;

@end
