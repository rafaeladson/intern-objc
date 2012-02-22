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
    GHAssertFalse([stack isEmpty], @"Stack should have elements once initialized");
    NSString *firstElement = [stack pop];
    GHAssertFalse([stack isEmpty], @"Stack should still have one element");
    GHAssertEqualStrings(@"bar", firstElement, @"Could pop one element from stack");
    NSString *secondElement = [stack pop];
    GHAssertTrue([stack isEmpty], @"Stack should have no more Elements");
    GHAssertEqualStrings(@"foo", secondElement, @"Cold also pop last element");
    NSString *elementThatShouldBeNil = [stack pop];
    GHAssertNil(elementThatShouldBeNil, @"When stack has no more elements, it should return nil");
                    
}

-(void) testPush {
    Stack *stack = [[Stack alloc] init];
    GHAssertTrue([stack isEmpty], @"Stack should be empty upon initialization");
    NSString *elementThatShouldBeNil = [stack pop];
    GHAssertNil(elementThatShouldBeNil, @"When stack is created empty, pop should return nil");
    [stack push:@"foo"];
    [stack push:@"bar"];
    GHAssertFalse([stack isEmpty], @"Stack shouldn't be empty anymore");
    GHAssertEqualStrings(@"bar", [stack pop], @"Element should pop last in");
    GHAssertEqualStrings(@"foo", [stack pop], @"Last element in stack should be popped");
    GHAssertTrue([stack isEmpty], @"Stack is empty again");
    
}

-(void) testPushNil {
    Stack *stack = [[Stack alloc] init];
    @try {
        [stack push:nil];
        GHFail(@"Exception should be raised");
    } @catch (NSException *exception) {
        GHAssertEqualStrings(NSInvalidArgumentException, [exception name], @"Exception should indicate invalid argument");
        GHAssertEqualStrings(@"Error: Cannot push nil into stack", [exception reason], @"Exception should have clear message");
    }
}


@end
