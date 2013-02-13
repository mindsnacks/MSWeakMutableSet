//
//  MSWeakMutableSet.h
//  MSAppKit
//
//  Created by Javier Soto on 6/27/12.
//  Copyright (c) 2012 MindSnacks. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @discussion Behaves exactly like an `NSMutableSet`, but doesn't retain the objects.
 */
@interface MSWeakMutableSet : NSProxy

- (id)init;

+ (NSMutableSet *)weakMutableSet;

@end
