//
//  PNTClientChannelGroupTestCase.h
//  Pods
//
//  Created by Jordan Zucker on 7/14/16.
//
//

#import "PNTClientTestCase.h"

@interface PNTClientChannelGroupTestCase : PNTClientTestCase

@property (nonatomic, assign, readonly) BOOL shouldRunChannelGroupSetUp;
@property (nonatomic, assign, readonly) BOOL shouldRunChannelGroupTearDown;
@property (nonatomic, copy, readonly) NSString *presenceChannelGroup;
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSArray<NSString *> *> *channelGroups;

@end
