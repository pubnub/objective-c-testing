//
//  XCTestCase+PNTSizeOfMessage.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/27/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@interface XCTestCase (PNTSizeOfMessage)

- (PNMessageSizeCalculationCompletionBlock)PNT_messageSizeCompletionWithSize:(NSInteger)expectedSize;

@end
