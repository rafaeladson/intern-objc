//
//  Stack.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Stack.h"
#import "PreConditions.h"

@interface Stack ()

@property(strong, nonatomic, readonly) NSMutableArray *wrapped;

@end

@implementation Stack

@synthesize wrapped = _wrapped;

-(Stack *) init {
    return [self initWithArray:[[NSArray alloc] init]];
}

-(Stack *) initWithArray:(NSArray *)array {
    self = [super init];
    if (self != nil ) {
        _wrapped = [[NSMutableArray alloc] initWithArray: array];
    }
    return self;
}

-(id) pop {
    if ( [self.wrapped count] ) {
        int lastElementIndex = [self.wrapped count] - 1;
        id elementToBeReturned = [self.wrapped objectAtIndex:lastElementIndex];
        [self.wrapped removeObjectAtIndex:lastElementIndex];
        return elementToBeReturned;
    } else {
        return nil;
    }
}

-(void) push:(id)element {
    [PreConditions checkNotNil:element withMessage:@"Error: Cannot push nil into stack"];
    [self.wrapped addObject:element];
    
}

-(bool) isEmpty {
    return [_wrapped count] == 0;
}
@end
