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

@interface RandomIterator()

@property(strong, atomic) Stack *itemsInRandomOrder;
-(void) sortByRandom:(NSMutableArray *)array;

@end

@implementation RandomIterator 

@synthesize itemsInRandomOrder = _itemsInRandomOrder;

-(id) initWithItems:(NSArray *)items {
    if ( self != nil ) {
        [PreConditions checkNotNil:items];
        NSMutableArray *mutableItems = [[NSMutableArray alloc] initWithArray:items];
        [self sortByRandom:mutableItems];
        _itemsInRandomOrder = [[Stack alloc] initWithArray:mutableItems];
      }
    return self;
}

-(bool) hasNext {
    return ![self.itemsInRandomOrder isEmpty];
}

-(id) next {
    if (![self.itemsInRandomOrder isEmpty]) {
        return [self.itemsInRandomOrder pop];
    } else {
        @throw [NSException exceptionWithName:NSRangeException reason:@"Error: cannot retrieve item from empty iterator. Did you forget to call hasNext?" 
                                     userInfo:nil];
    }
}

-(void) sortByRandom:(NSMutableArray *)array {
    for(int i = 0; i < [array count]; i++) {
        int indexOfExchange = (arc4random() % ([array count] - i ) ) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:indexOfExchange];
    }
    
}



@end
