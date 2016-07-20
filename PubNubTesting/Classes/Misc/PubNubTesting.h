//
//  PubNubTesting.h
//  Pods
//
//  Created by Jordan Zucker on 5/16/16.
//
//

#ifndef PubNubTesting_h
#define PubNubTesting_h

// Constants
#import "PNTTestConstants.h"

// Matchers
#import "PNTDeviceIndependentMatcher.h"

// Test Representations
#import "PNTTestResult.h"
#import "PNTTestStatus.h"

// Utilities
#import "XCTestCase+PNTAdditions.h"
#import "NSString+PNTAdditions.h"

#import "PNTStack.h"

//#import "PNTTestErrorStatus.h"
//#import "PNTTestAcknowledgmentStatus.h"
//#import "PNTTestChannelGroupChannelsResult.h"
//#import "PNTTestChannelGroupsResult.h"
//#import "PNTTestHistoryResult.h"
//#import "PNTTestPublishStatus.h"
//#import "PNTTestTimeResult.h"
//#import "PNTTestSubscribeStatus.h"
//#import "PNTTestSubscriberResults.h"


// Categories
#import "XCTestCase+PNTChannelGroup.h"
#import "XCTestCase+PNTTimeToken.h"
#import "XCTestCase+PNTClientState.h"
#import "XCTestCase+PNTHistory.h"
#import "XCTestCase+PNTPublish.h"
#import "XCTestCase+PNTSizeOfMessage.h"
#import "XCTestCase+PNTPresence.h"
//#import "XCTestCase+PNTSubscription.h"

// TestCase Subclasses
#import "PNTClientTestCase.h"
#import "PNTClientChannelGroupTestCase.h"
#import "PNTSubscribeLoopTestCase.h"

#endif /* PubNubTesting_h */
