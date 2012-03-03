//
//  ViewHelper.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewHelper : NSObject

-(void) typeText:(NSString *)text onTextField:(UITextField *)textField;

-(void) typeText:(NSString *)text onTextView:(UITextView *)textView;

@end
