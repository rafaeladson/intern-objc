//
//  RandomIterator.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RandomIterator.h"
#import "Stack.h"
#import "PreConditions.h"

@implementation RandomIterator 

@synthesize _itemsInRandomOrder;

-(id) initWithItems:(NSArray *)items {
    if ( self != nil ) {
        NSMutableArray *mutableItems = [[NSMutableArray alloc] initWithArray:items];
        [self _sortByRandom:mutableItems];
        self._itemsInRandomOrder = [[Stack alloc] initWithArray:mutableItems];
      }
    return self;
}

-(bool) hasNext {
    return ![self._itemsInRandomOrder isEmpty];
}

-(id) next {
    if (![self._itemsInRandomOrder isEmpty]) {
        return [self._itemsInRandomOrder pop];
    } else {
        @throw [NSException exceptionWithName:NSRangeException reason:@"Error: cannot retrieve item from empty iterator. Did you forget to call hasNext?" 
                                     userInfo:nil];
    }
}

-(void) _sortByRandom:(NSMutableArray *)array {
    for(int i = 0; i < [array count]; i++) {
        int indexOfExchange = (arc4random() % ([array count] - i ) ) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:indexOfExchange];
    }
    
}




    

@end
