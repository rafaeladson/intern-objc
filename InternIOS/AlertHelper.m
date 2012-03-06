//
//  AlertHelper.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlertHelper.h"
#import <UIKit/UIKit.h>


@implementation AlertHelper

-(void) showAlertDialogWithMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedStringFromTable(@"Alert", @"Intern", nil) message:message delegate:nil cancelButtonTitle:NSLocalizedStringFromTable(@"Close", @"Intern", nil) otherButtonTitles:nil];
    [alertView show];
}

@end
