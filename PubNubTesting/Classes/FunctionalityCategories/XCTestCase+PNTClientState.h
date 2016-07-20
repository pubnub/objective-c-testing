//
//  XCTestCase+PNTClientState.h
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@class PNTTestClientStateUpdateStatus;

@interface XCTestCase (PNTClientState)

- (PNSetStateCompletionBlock)PNT_setClientStateWithExpectedStatus:(PNTTestClientStateUpdateStatus *)expectedStatus;

@end
