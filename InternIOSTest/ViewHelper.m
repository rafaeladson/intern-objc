//
//  ViewHelper.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewHelper.h"

@implementation ViewHelper

-(void) typeText:(NSString *)text onTextField:(UITextField *)textField {
    [textField performSelectorOnMainThread:@selector(setText:) withObject:text waitUntilDone:YES];

}

@end
