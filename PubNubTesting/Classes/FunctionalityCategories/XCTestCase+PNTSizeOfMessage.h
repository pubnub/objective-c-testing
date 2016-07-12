//
//  XCTestCase+PNTSizeOfMessage.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@interface XCTestCase (PNTSizeOfMessage)

- (PNMessageSizeCalculationCompletionBlock)PNT_messageSizeCompletionWithSize:(NSInteger)expectedSize;

@end
