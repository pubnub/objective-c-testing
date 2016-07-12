//
//  PNTTestStatus.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "PNTTestStatus.h"

@interface PNTTestStatus ()
@property (nonatomic, readwrite, assign) PNStatusCategory category;
@property (nonatomic, readwrite, assign, getter = isError) BOOL error;

@end

@implementation PNTTestStatus

- (instancetype)initStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError andPubNubStatus:(PNStatus *)pubNubStatus {
    self = [super initResultWithClient:client statusCode:statusCode operation:operationType andPubNubResult:(PNResult *)pubNubStatus];
    if (self) {
        _category = category;
        _error = isError;
    }
    return self;
}

+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError andPubNubStatus:(PNStatus *)pubNubStatus {
    return [[self alloc] initStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:isError andPubNubStatus:pubNubStatus];
}

- (NSArray<NSString *> *)keysToAssert {
    NSMutableArray *superKeys = [super keysToAssert].mutableCopy;
    [superKeys addObjectsFromArray:@[
                                     @"category",
                                     @"error"
                                     ]];
    return superKeys.copy;
}

@end

@implementation PNTTestErrorStatus

- (instancetype)initErrorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category andPubNubStatus:(PNErrorStatus *)pubNubErrorStatus {
    self = [super initStatusWithClient:client statusCode:statusCode operation:operationType category:category isError:YES andPubNubStatus:(PNStatus *)pubNubErrorStatus];
    return self;
}

+ (instancetype)errorStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category andPubNubStatus:(PNErrorStatus *)pubNubErrorStatus {
    return [[self alloc] initErrorStatusWithClient:client statusCode:statusCode operation:operationType category:category andPubNubStatus:pubNubErrorStatus];
}

@end

@implementation PNTTestAcknowledgmentStatus

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError andPubNubStatus:(PNAcknowledgmentStatus *)pubNubAcknowledgmentStatus {
    self = [super initErrorStatusWithClient:client statusCode:statusCode operation:operationType category:PNAcknowledgmentCategory andPubNubStatus:pubNubAcknowledgmentStatus];
    return self;
}

+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError andPubNubStatus:(PNAcknowledgmentStatus *)pubNubAcknowledgmentStatus {
    return [[self alloc] initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:operationType isError:isError andPubNubStatus:pubNubAcknowledgmentStatus];
}

@end
