//
//  PNTClientTestCase.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/20/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>
#import "PNTTestConstants.h"

@interface PNTClientTestCase : XCTestCase

@property (nonatomic, strong, readonly) PNConfiguration *configuration;
@property (nonatomic, strong, readonly) PubNub *client;

- (PNConfiguration *)clientConfiguration;

- (void)waitFor:(NSTimeInterval)timeout;
- (void)waitFor:(NSTimeInterval)timeout withHandler:(XCWaitCompletionHandler)handler;



@end
