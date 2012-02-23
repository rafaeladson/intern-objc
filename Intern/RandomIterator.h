//
//  RandomIterator.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Stack;

@interface RandomIterator : NSObject {
    Stack *_itemsInRandomOrder;
}

-(RandomIterator *) initWithItems:(NSArray *)items;
-(bool) hasNext;
-(id) next;

@property(strong, atomic) Stack *_itemsInRandomOrder;
-(void) _sortByRandom:(NSMutableArray *)array;

@end

