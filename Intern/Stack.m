//
//  Stack.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Stack.h"
#import "PreConditions.h"

@implementation Stack

@synthesize _wrapped;

-(Stack *) init {
    return [self initWithArray:[[NSArray alloc] init]];
}

-(Stack *) initWithArray:(NSArray *)array {
    if (self != nil ) {
        self._wrapped = [[NSMutableArray alloc] initWithArray: array];
    }
    return self;
}

-(id) pop {
    if ( [self._wrapped count] ) {
        int lastElementIndex = [self._wrapped count] - 1;
        id elementToBeReturned = [self._wrapped objectAtIndex:lastElementIndex];
        [self._wrapped removeObjectAtIndex:lastElementIndex];
        return elementToBeReturned;
    } else {
        return nil;
    }
}

-(void) push:(id)element {
    [PreConditions checkNotNil:element withMessage:@"Error: Cannot push nil into stack"];
    [self._wrapped addObject:element];
    
}

@end
