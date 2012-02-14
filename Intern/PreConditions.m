//
//  PreConditions.m
//  Intern
//
//  Created by Rafael Adson Barbosa Barros on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreConditions.h"

@implementation PreConditions

+(void) checkNotNil:(id)argument {
    [PreConditions checkNotNil:argument withMessage:@"Argument should not be nil"];
}

+(void) checkNotNil:(id)argument withMessage:(NSString *)message {
    if ( argument == nil ) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:message userInfo:nil];
    }
}


@end
