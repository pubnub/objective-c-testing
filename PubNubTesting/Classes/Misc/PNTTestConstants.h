//
//  PNTTestConstants.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <Foundation/Foundation.h>

#ifndef PNTTestConstants_h
#define PNTTestConstants_h

#define PNTWeakify(__var) \
__weak __typeof__(__var) __var ## _weak_ = (__var)

#define PNTStrongify(__var) \
_Pragma("clang diagnostic push"); \
_Pragma("clang diagnostic ignored  \"-Wshadow\""); \
__strong __typeof__(__var) __var = __var ## _weak_; \
_Pragma("clang diagnostic pop") \

typedef NS_ENUM(NSUInteger, PNTTestSubscribeComparisonType) {
    PNTTestSubscribeComparisonTypeMatchExactly,
    PNTTestSubscribeComparisonTypeContains,
};

static NSTimeInterval const kPNTDebugTimeout = 120.0;

static NSTimeInterval const kPNTDefaultTimeout = 5.0;
//static NSTimeInterval const kPNTDefaultTimeout = kPNTDebugTimeout;
static NSTimeInterval const kPNTPublishTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSizeOfMessageTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTTimeTokenTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTChannelGroupChangeTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSubscribeTimeout = 20.0;
static NSTimeInterval const kPNTUnsubscribeTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSetClientStateTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTHistoryTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTPresenceTimeout = kPNTDefaultTimeout;

#endif /* PNTTestConstants_h */
