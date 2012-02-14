//
//  PreConditionsTest.m
//  Intern
//
//  Created by Rafael Adson Barbosa Barros on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <GHUnitIOS/GHUnit.h>
#import "PreConditions.h"

@interface PreConditionsTest : GHTestCase {}

@end

@implementation PreConditionsTest

-(void) testCheckNil_valueIsNotNil {
    [PreConditions checkNotNil:@"test"];
    
}

-(void) testCheckNil_valueIsNil {
    @try {
        [PreConditions checkNotNil:nil];
        GHFail(@"Should have caused an exception");
    } @catch (NSException *e) {
        GHAssertEqualStrings(@"Argument should not be nil", [e reason], @"Checking not null default exception reason");
    }
    
}

@end
