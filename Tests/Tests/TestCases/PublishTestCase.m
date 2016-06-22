//
//  PublishTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface PublishTestCase : PNTClientTestCase

@end

@implementation PublishTestCase

- (BOOL)isRecording {
    return NO;
}

- (void)testPublishString {
    PNTTestPublishStatus *expectedStatus = [PNTTestPublishStatus successfulStatusWithClient:self.client timeToken:@14665431616192699];
    [self.client publish:@"test" toChannel:self.publishChannel withCompletion:[self PNT_completionWithExpectedPublishStatus:expectedStatus]];
    [self waitFor:kPNTPublishTimeout];
}

- (void)testPublishNilMessage {
    PNTTestPublishStatus *expectedStatus = [PNTTestPublishStatus failedStatusWithClient:self.client];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [self.client publish:nil toChannel:self.publishChannel withCompletion:[self PNT_completionWithExpectedPublishStatus:expectedStatus]];
#pragma clang diagnostic pop
    [self waitFor:kPNTPublishTimeout];
}

@end
