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
#import "ViewHelperController.h"


@interface ViewHelperTest : GHTestCase

@property (strong, nonatomic) ViewHelperController *controller;

@end


@implementation ViewHelperTest

@synthesize controller = _controller;

-(void) setUp {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SampleViews" bundle:nil];
    self.controller = [storyboard instantiateViewControllerWithIdentifier:@"ViewHelperController"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

-(void) testPreconditions {
    GHAssertNotNil(self.controller.textField, nil);
    GHAssertNotNil(self.controller.textView, nil);
}

-(void) testShouldUpdateTextOnTextField {
    ViewHelper *helper = [[ViewHelper alloc] init];
    [helper typeText:@"Hello" onTextField:self.controller.textField];
    GHAssertEqualStrings(@"Hello", self.controller.textField.text, nil);
}

-(void) testShouldUpdateTextOnTextView {
    ViewHelper *helper = [[ViewHelper alloc] init];
    
    [helper typeText:@"Hello" onTextView:self.controller.textView];
    GHAssertEqualStrings(@"Hello", self.controller.textView.text, nil);
}

@end
