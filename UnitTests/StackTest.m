//
//  StackTest.m
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "Stack.h"


@interface StackTest : GHTestCase {
}
@end



@implementation StackTest


-(void) testPop {
    Stack *stack = [[Stack alloc] initWithArray:[NSArray arrayWithObjects:@"foo", @"bar", nil]];
    NSString *firstElement = [stack pop];
    GHAssertEqualStrings(@"bar", firstElement, @"Could pop one element from stack");
    NSString *secondElement = [stack pop];
    GHAssertEqualStrings(@"foo", secondElement, @"Cold also pop last element");
    NSString *elementThatShouldBeNil = [stack pop];
    GHAssertNil(elementThatShouldBeNil, @"When stack has no more elements, it should return nil");
                    
}

-(void) testPush {
    Stack *stack = [[Stack alloc] init];
    NSString *elementThatShouldBeNil = [stack pop];
    GHAssertNil(elementThatShouldBeNil, @"When stack is created empty, pop should return nil");
    [stack push:@"foo"];
    [stack push:@"bar"];
    GHAssertEqualStrings(@"bar", [stack pop], @"Element should pop last in");
    GHAssertEqualStrings(@"foo", [stack pop], @"Last element in stack should be popped");
    GHAssertNil([stack pop], @"Stack is empty again");
    
}


@end
