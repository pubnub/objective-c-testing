//
//  PNTPublishTestCase.m
//  Pods
//
//  Created by Jordan Zucker on 5/18/16.
//
//

#import "PNTPublishTestCase.h"
#import "XCTestCase+PNTAdditions.h"
#import "XCTestCase+PNTPublish.h"
#import "PNTTestPublishStatus.h"

@implementation PNTPublishTestCase

- (NSString *)publishChannel {
    return @"a";
}

- (void)testPublishString {
    PNTTestPublishStatus *expectedStatus = [PNTTestPublishStatus successfulStatusWithClient:self.client timeToken:@14635928295897605];
    [self.client publish:@"test" toChannel:self.publishChannel withCompletion:[self PNT_completionWithExpectedPublishStatus:expectedStatus]];
    [self waitFor:kPNTPublishTimeout];
}

@end
