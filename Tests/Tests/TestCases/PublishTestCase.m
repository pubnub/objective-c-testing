//
//  PublishTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNub_Testing/PubNubTesting.h>

@interface PublishTestCase : PNTClientTestCase

@end

@implementation PublishTestCase

- (BOOL)isRecording {
    return NO;
}

- (void)testPublishString {
    PNTTestPublishStatus *expectedStatus = [PNTTestPublishStatus successfulStatusWithClient:self.client timeToken:@14635351328797872];
    [self.client publish:@"test" toChannel:self.publishChannel withCompletion:[self PNT_completionWithExpectedPublishStatus:expectedStatus]];
    [self waitFor:kPNTPublishTimeout];
}

@end
