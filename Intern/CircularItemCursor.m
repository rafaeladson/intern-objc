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

@interface CircularItemCursor ()

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) RandomIterator *iterator;
@property (strong, nonatomic, readwrite) id currentItem;

@end

@implementation CircularItemCursor

@synthesize items = _items, iterator = _iterator, currentItem = _currentItem;

-(CircularItemCursor *) initWithArray:(NSArray *)array {
    if ( self != nil ) {
        [PreConditions checkNotNil:array];
        [PreConditions checkArgument:([array count] > 0) withMessage:@"Error: Cannot instantiate circularitemcursor with 0 items. Not supported."];
        _items = [[NSArray alloc] initWithArray:array];
        _iterator = [[RandomIterator alloc] initWithItems:array];
        _currentItem = [self.iterator next];
    }
    return self;
}

-(void) goToNext {
    if ( ![self.iterator hasNext] ) {
        self.iterator = [[RandomIterator alloc] initWithItems:self.items];
    }
    self.currentItem = [self.iterator next];
}

-(id) getCurrent {
    return self.currentItem;
}

@end
