//
//  PublishSizeOfMessageTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface PublishSizeOfMessageTestCase : PNTClientTestCase

@end

@implementation PublishSizeOfMessageTestCase

- (BOOL)isRecording {
    return YES;
}

- (void)testSize10kCharacterStringMessageWithStoreInHistoryAndCompressed {
    NSString *message = [NSString PNT_randomAlphanumericStringWithLength:10000];
    [self.client sizeOfMessage:message toChannel:self.publishChannel compressed:YES storeInHistory:YES withCompletion:[self PNT_messageSizeCompletionWithSize:7971]];
    [self waitFor:kPNTSizeOfMessageTimeout];
}

@end
