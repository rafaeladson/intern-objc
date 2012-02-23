//
//  CircularItemCursor.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CircularItemCursor.h"
#import "RandomIterator.h"
#import "PreConditions.h"

@implementation CircularItemCursor

@synthesize _items, _iterator, _currentItem;

-(CircularItemCursor *) initWithArray:(NSArray *)array {
    if ( self != nil ) {
        [PreConditions checkNotNil:array];
        [PreConditions checkArgument:([array count] > 0) withMessage:@"Error: Cannot instantiate circularitemcursor with 0 items. Not supported."];
        self._items = [[NSArray alloc] initWithArray:array];
        self._iterator = [[RandomIterator alloc] initWithItems:array];
        self._currentItem = [self._iterator next];
    }
    return self;
}

-(void) goToNext {
    if ( ![self._iterator hasNext] ) {
        self._iterator = [[RandomIterator alloc] initWithItems:self._items];
    }
    self._currentItem = [self._iterator next];
}

-(id) getCurrent {
    return self._currentItem;
}

@end
