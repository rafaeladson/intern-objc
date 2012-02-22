//
//  RandomIteratorTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "RandomIterator.h"

@interface RandomIteratorTest : GHTestCase

@end


@implementation RandomIteratorTest

-(void) testInitWithEmptyArray {
    NSArray *emptyArray = [[NSArray alloc] init];
    RandomIterator *iterator = [[RandomIterator alloc] initWithItems:emptyArray];
    GHAssertFalse([iterator hasNext], @"empty iterator will not have next");
    
    @try {
        [iterator next];
        GHFail(@"Should have thrown an exception");
    } @catch (NSException *exception) {
        GHAssertEqualStrings(@"Error: cannot retrieve item from empty iterator. Did you forget to call hasNext?", [exception reason], 
                             @"Exception reason should indicate what happened");
    }

}

-(void) testForArrayWithOneElement {
    NSArray *oneElementArray = [[NSArray alloc] initWithObjects:@"foo", nil];
    RandomIterator *iterator = [[RandomIterator alloc] initWithItems:oneElementArray];
    GHAssertTrue([iterator hasNext], @"iterator with one element should have next");
    GHAssertEqualStrings(@"foo", [iterator next], @"could retrieve iterator sole item");
    GHAssertFalse([iterator hasNext], @"iterator has no more elements");
}

-(void) testForArrayWithTwoElements {
    NSArray *twoElementsArray = [[NSArray alloc] initWithObjects:@"foo", @"bar", nil];
    RandomIterator *iterator = [[RandomIterator alloc] initWithItems:twoElementsArray];
    GHAssertTrue([iterator hasNext], @"Iterator has items");
    NSString *firstElement = [iterator next];
    NSString *secondElement = [iterator next];
    GHAssertNotEqualStrings(firstElement, secondElement, @"both calls to next should have returned different elements");
    GHAssertFalse([iterator hasNext], @"iterator should have no more elements");
}


@end
