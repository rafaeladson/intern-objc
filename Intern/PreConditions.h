//
//  PreConditions.h
//  Intern
//
//  Created by Rafael Adson Barbosa Barros on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreConditions : NSObject

+(void) checkNotNil:(id)argument;
+(void) checkNotNil:(id)argument withMessage:(NSString *)message;
+(void) checkDoesNotContainNil:(NSArray *)array;
+(void) checkDoesNotContainNil:(NSArray *)array withMessage:(NSString *)message;


@end
