//
//  PNTClientTestCase.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/20/16.
//
//

#import <BeKindRewind/BeKindRewind.h>
#import <PubNub/PubNub.h>
#import "PNTTestConstants.h"

@interface PNTClientTestCase : BKRTestCase

@property (nonatomic, strong, readonly) PNConfiguration *configuration;
@property (nonatomic, strong, readonly) PubNub *client;
@property (nonatomic, copy, readonly) NSString *publishChannel;
@property (nonatomic, copy, readonly) NSString *historyChannel;

- (PNConfiguration *)clientConfiguration;



@end
