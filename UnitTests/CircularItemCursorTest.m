//
//  CircularItemCursorTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "CircularItemCursor.h"

@interface CircularItemCursorTest : GHTestCase
    
@end

@implementation CircularItemCursorTest


-(void) testUseWithOneElement {
    NSArray *arrayWithOneElement = [[NSArray alloc] initWithObjects:@"foo", nil];
    CircularItemCursor *cursor = [[CircularItemCursor alloc] initWithArray:arrayWithOneElement];
    GHAssertEqualStrings(@"foo", [cursor getCurrent], @"First get current");
    [cursor goToNext];
    GHAssertEqualStrings(@"foo", [cursor getCurrent], @"Second get current");
}

-(void) testUseWithTwoElements {
    NSArray *arrayWithTwoElements = [[NSArray alloc] initWithObjects:@"foo", @"bar", nil];
    CircularItemCursor *cursor = [[CircularItemCursor alloc] initWithArray:arrayWithTwoElements];
    NSString *firstElement = [cursor getCurrent];
    NSString *stillFirstElement = [cursor getCurrent];
    GHAssertEqualStrings(firstElement, stillFirstElement, @"should not have advanced since fetching first value");
    [cursor goToNext];
    NSString *secondElement = [cursor getCurrent];
    GHAssertNotEqualStrings(firstElement, secondElement, @"first element should be different than second element");
    [cursor goToNext];
    NSString *elementAfterRestart = [cursor getCurrent];
    GHAssertTrue([elementAfterRestart isEqualToString:firstElement] || [elementAfterRestart isEqualToString:secondElement], 
                 @"%@ should be equal to %@ or to %@", elementAfterRestart, firstElement, secondElement );
    
}

-(void) testInitWithZeroElements {
    @try {
        NSArray *emptyArray = [[NSArray alloc] init];
        CircularItemCursor *cursor = [[CircularItemCursor alloc] initWithArray:emptyArray];
        GHFail(@"should not be able to instantiate %@ with 0 elements. It's supposed to be not allowed", cursor);
    } @catch (NSException *exception ) {
        GHAssertEqualStrings(@"Error: Cannot instantiate circularitemcursor with 0 items. Not supported.", [exception reason],
                             @"Exception should have descriptive message");
    }
}

-(void) testInitWithNil {
    @try {
        CircularItemCursor *cursor = [[CircularItemCursor alloc] initWithArray:nil];
        GHFail(@"cursor %@ should not be instantiated with nil", cursor);
    } @catch (NSException *exception) {
        GHAssertEqualStrings(@"Argument must not be nil", [exception reason], @"Should have correct message");
    }
}


@end
