//
//  ViewHelperTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "ViewHelper.h"


@interface ViewHelperTest : GHTestCase

@end


@implementation ViewHelperTest

-(void) testShouldUpdateTextOnTextField {
    UITextField*view = [[UITextField alloc] init];
    ViewHelper *helper = [[ViewHelper alloc] init];
    [helper typeText:@"Hello" onTextField:view];
    GHAssertEqualStrings(@"Hello", view.text, nil);
}

@end
