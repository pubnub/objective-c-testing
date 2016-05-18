//
//  PNTTestConstants.h
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#ifndef PNTTestConstants_h
#define PNTTestConstants_h

#define objc_dynamic_cast(obj, cls) \
([obj isKindOfClass:(Class)objc_getClass(#cls)] ? (cls *)obj : NULL)

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

static NSTimeInterval const kPNTDefaultTimeout = 5.0;
static NSTimeInterval const kPNTPublishTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSizeOfMessageTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTTimeTokenTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTChannelGroupChangeTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSubscribeTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTUnsubscribeTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTSetClientStateTimeout = kPNTDefaultTimeout;
static NSTimeInterval const kPNTHistoryTimeout = kPNTDefaultTimeout;

#endif /* PNTTestConstants_h */
