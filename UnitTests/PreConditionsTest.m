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
        GHAssertEqualStrings(@"Argument must not be nil", [e reason], @"Checking not null default exception reason");
    }
    
}

-(void) testCheckNil_valueIsNil_customMessage {
    @try {
        [PreConditions checkNotNil:nil withMessage:@"message"];
        GHFail(@"Should have raised an exception");
    }
    @catch (NSException *exception) {
        GHAssertEqualStrings(@"message", [exception reason], @"Message should have been customized");
        GHAssertEqualStrings(NSInvalidArgumentException, [exception name], @"Name should indicate that it's an illegal argument");
    }
}

-(void) testCheckArgument_argumentIsTrue {
    [PreConditions checkArgument:2>1];
    [PreConditions checkArgument:@"foo" withMessage:@"bar"];
}

-(void) testCheckArgument_argumentIsFalse {
    @try {
        [PreConditions checkArgument:false];
        GHFail(@"Check argument should have failed");
    } @catch (NSException *exception) {
        GHAssertEqualStrings(NSInvalidArgumentException, [exception name], @"Exception message should indicate it's an illegal argument");
        GHAssertEqualStrings(@"Argument is invalid", [exception reason], @"Message should indicate why the invocation failed"); 
    }
    
    @try {
        [PreConditions checkArgument:false withMessage:@"message"];
        GHFail(@"check argument should have failed");
    }
    @catch (NSException *exception) {
        GHAssertEqualStrings(@"message", [exception reason], @"exception should have custom message");
    }
    
}

-(void) testCheckArgument_argumentIsNil {
    @try {
        [PreConditions checkArgument:nil];
        GHFail(@"should have launched an exception");
    }
    @catch (NSException *exception) {
        GHAssertEqualStrings(@"Argument is invalid", [exception reason], @"nil should be treated as false");
    }
}



@end
