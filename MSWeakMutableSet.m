//
//  MSWeakMutableSet.m
//  MSAppKit
//
//  Created by Javier Soto on 6/27/12.
//  Copyright (c) 2012 MindSnacks. All rights reserved.
//

#import "MSWeakMutableSet.h"

static CFStringRef MSWeakSetDescriptionCallBack(const void *value);
static Boolean MSWeakSetEqualCallBack(const void *value1, const void *value2);
static CFHashCode MSWeakSetHashCallBack(const void *value);

@interface MSWeakMutableSet()

@property (nonatomic, assign) NSMutableSet *set;

@end

@implementation MSWeakMutableSet

- (id)init
{
    CFSetCallBacks setCallbacks;
    setCallbacks.retain = NULL;
    setCallbacks.release = NULL;
    setCallbacks.copyDescription = *MSWeakSetDescriptionCallBack;
    setCallbacks.equal = *MSWeakSetEqualCallBack;
    setCallbacks.hash = *MSWeakSetHashCallBack;

    self.set = (NSMutableSet *)CFSetCreateMutable(kCFAllocatorDefault, 0, &setCallbacks);

    return self;
}

+ (NSMutableSet *)weakMutableSet
{
    return [[[self alloc] init] autorelease];
}

- (void)dealloc
{
    [_set release];
    
    [super dealloc];    
}

#pragma mark - NSProxy

- (id)forwardingTargetForSelector:(SEL)selector
{
    return self.set;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [self.set respondsToSelector:aSelector];
}

- (NSString *)description
{
    return [self.set description];
}

@end

#pragma mark - CFSetCallBacks

static CFStringRef MSWeakSetDescriptionCallBack(const void *value)
{
    return (CFStringRef)[(id)value description];
}

static Boolean MSWeakSetEqualCallBack(const void *value1, const void *value2)
{
    return (Boolean)[(id)value1 isEqual:(id)value2];
}

static CFHashCode MSWeakSetHashCallBack(const void *value)
{
    return [(id)value hash];
}

